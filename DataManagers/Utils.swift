//
//  Utils.swift
//  MyCliniQ
//
//  Created by GuruApzzo on 06/09/23.
//

import Foundation
import UIKit


class Utils: NSObject {
    
    static var enableDarkStatusBar = false
    static var loginTimer: Timer?
    static var loginTimeS = 120
    static var isAccountDeleted = false
    static var isFromSplash = false
    
    
    
    
    class func invalidateLoginTimer() {
        Utils.loginTimer?.invalidate()
        Utils.loginTimer = nil
        Utils.loginTimeS = 120
    }
    
    class func convertSecondsToTime(seconds: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute,.second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: TimeInterval(seconds))!
    }
    
//    class func showSessionInvalidAlert() {
//        let alertController = UIAlertController(title: "Token Expired", message: "Please try to login again.", preferredStyle: .alert)
//        let OKAction = UIAlertAction(title: "Ok", style: .default) { (_: UIAlertAction!) in
//            Utils.setRootController(rootVCType: .loginVC)
//        }
//        alertController.addAction(OKAction)
//        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
//    }
    
    class func logout() {
        CustomUserDefaults.accessToken = nil
        CustomUserDefaults.refreshAccessToken =  nil
        CustomUserDefaults.userId = nil
        CustomUserDefaults.CustomerId = nil
        CustomUserDefaults.name = nil
        CustomUserDefaults.emailID = nil
        setRootController(rootVCType: .loginVC)
        
    }
    
    
//     MARK: Set Root Controller
 
    class func setRootController(rootVCType: RootVCType) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let loginVC = LoginVC.instantiateFromStoryboard()
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        switch rootVCType {
        case .loginVC:
          UIApplication.shared.windows.first?.rootViewController = CustomNavigationController(rootViewController: loginVC)
        case .tabbarVC:
            UIApplication.shared.windows.first?.rootViewController = CustomNavigationController(rootViewController: PointerTabBarControllerVC.instantiateFromStoryboard())
        }
        UIApplication.shared.windows.first?.makeKeyAndVisible()
      }
    
    // MARK: - Authentication Validations
    
    class func isValidEmail(emailId: String?) -> Bool {
        guard let emailId = emailId, !emailId.contains("..") else { return false }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailId)
    }
    
    /// - Parameter password: Password (String)
    /// - Returns: Returns **true** if password validation success else it will return **false**
    class func isValidPassword(password: String) -> Bool {
        let res = Utils.validatePassword(password: password)
        return res.minChar && res.lowerCase && res.upperCase && res.specialChars
    }
    
    /// - Check password validations for minimum requirements (Regex)
    /// - Parameter password: Password (String)
    /// - Returns: Returns a tuple of Bool's
    class func validatePassword(password: String) -> (minChar: Bool, upperCase: Bool, lowerCase: Bool, specialChars: Bool) {
        // At least 8 characters
        let minChar = password.count >= 12
        
        // At least 1 upper case letter (A-Z)
        var passwordRegEx = "(.*[A-Z]+.*)"
        var passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        let upperCase = passwordPredicate.evaluate(with: password)
        
        // At least 1 lower case letter (a-z)
        passwordRegEx = "(.*[a-z]+.*)"
        passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        let lowerCase = passwordPredicate.evaluate(with: password)
        
        // At least 1 number OR 1 special character (.*[0-9]+.*)|(.*[!&^%$*#@()/]+.*)
        passwordRegEx = "(.*[0-9]+.*)|(.*[!&^%$*#@()/]+.*)"
        passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        let specialChars = passwordPredicate.evaluate(with: password)
        return (minChar, upperCase, lowerCase, specialChars)
        
    }
    
    class func DateTimeString(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "HH:mm a, MMM dd yyyy" // Use "HH" for 24-hour format
            dateFormatter.timeZone = TimeZone.current // Set the time zone to the current local time zone
            dateFormatter.locale = Locale(identifier: "en_IN")
            
            return dateFormatter.string(from: date)
        } else {
            return "Invalid Date Format"
        }
    }
    
    class func timeFormatted(_ totalSeconds: Int) -> String {
            let seconds: Int = totalSeconds % 60
            let minutes: Int = (totalSeconds / 60) % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }
    
}
