//
//  File.swift
//  Pointer
//
//  Created by Apzzo Technologies Private Limited on 24/06/24.
//

import Foundation
import UIKit

class OtpVC: UIViewController{
    
    static let name = "OtpVC "
    static let storyBoard = "Otp"
    
    class func instantiateFromStoryboard() -> OtpVC {
        let vc = UIStoryboard(name: OtpVC.storyBoard, bundle: nil).instantiateViewController(withIdentifier: OtpVC.name ) as! OtpVC
        return vc
    }
    
    @IBOutlet var otpTextField: AEOTPTextField!
       @IBOutlet var otpV: UIView!
       @IBOutlet var otpTimerL: UILabel!
       @IBOutlet var otpL: UILabel!
       @IBOutlet var resendOtpB: UIButton!
       @IBOutlet var verifyV:UIView!
       @IBOutlet var centerV:UIView!
       @IBOutlet var emailLabel: UILabel!
       @IBOutlet var otpLabel: UILabel!
       @IBOutlet var otpT: UITextField!
    
    
    var isFromSignUp = false
        var isTaskManagerLogin = false
        var emailId = ""
        var loginToken = ""
        var isTimerStarted = false
        var timeCount = 30               /// Total OTP Timer Count
        var timer: Timer!
        var otpTitleText = ""
        var subtitleText = ""

    
    // MARK: - Override Function

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    @IBAction func actionOnResend(_sender: UIButton) {
            if !isTimerStarted {
                timer.invalidate()
                timeCount = 30
                otpL.isHidden = false
                startTimer()
                otpTextField.clearOTPText()  /// clear the old OTP
                resendOTPServerCall()
            }
        }
    
    @IBAction func actionOnVerify(_sender: UIButton) {
    //        if otpTextField.text!.isEmpty {
    //            Utils.showAlert(message: "Please enter your OTP.", viewController: self)
    //        } else {
    //            verifyUserServerCall()
    //        }
            if otpT.text!.isEmpty {
                Utils.showAlert(message: "Please enter your OTP.", viewController: self)
            } else {
                verifyUserServerCall()
            }
        }
    
    /// Action Back - It will take user to Previous Screen
        /// - Parameter _sender: sender(UIButton)
        @IBAction func actionOnBack(_sender: UIButton) {
            navigationController?.popViewController(animated: true)
        }

    
    @IBAction func actionOnContinue() {
        let nectVc = PointerTabBarControllerVC.instantiateFromStoryboard()
        navigationController?.pushViewController(nectVc, animated: true)
    }
    
    func setupViews(){
       
    }
    
    func OTPTextFieldSetup() {
            otpTextField.configure()
            otpTextField.configure(with: 4)
            otpTextField.otpTextColor = UIColor.init(hexStr: "2D2B2E")
            otpTextField.otpDefaultBorderColor = UIColor.init(hexStr: "4E82DC")
            otpTextField.otpFilledBorderColor = UIColor.init(hexStr: "4E82DC")
            otpTextField.otpDelegate = self
            otpTextField.isSecureTextEntry = true
            otpTextField.otpCornerRaduis = 10
        }

      func startTimer() {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            resendOtpB.isEnabled = false
        }


    @objc func updateTime() {
            otpTimerL.text = "\(Utils.timeFormatted(timeCount))"
            otpL.text = "You can resend OTP in "
            if timeCount != 0 {
                timeCount -= 1
            } else {
                Utils.endTimer(timer: timer)
                otpTimerL.text = "Resend"
                otpL.text = "Don’t receive OTP yet? "
                resendOtpB.isEnabled = true
            }
        }


    func didUserFinishEnter(the code: String) {
           if code.count == 4 {
               verifyUserServerCall()
           }
       }

    
}


extension OtpVerificationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
