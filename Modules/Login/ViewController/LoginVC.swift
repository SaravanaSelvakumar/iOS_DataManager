//
//  LoginVC.swift
//  Pointer
//
//  Created by Apzzo Technologies Private Limited on 19/06/24.
//

import Foundation
import UIKit

class LoginVC: UIViewController {
    
    static let name = "LoginVC"
    static let storyBoard = "Login"
    
    /// The caller of this class does not need to know how we instantiate it.
    /// We simply return the instantiated class to the caller and they invoke it how they want
    /// If the as! fails, it will fail upon immediate testing
    class func instantiateFromStoryboard() -> LoginVC {
        let vc = UIStoryboard(name: LoginVC.storyBoard, bundle: nil).instantiateViewController(withIdentifier: LoginVC.name) as! LoginVC
        return vc
    }
    
    @IBOutlet weak var phoneNoTf: UITextField!
    @IBOutlet weak var phoneV: UIView!
    @IBOutlet weak var continueeV: UIView!
    @IBOutlet weak var mainPhoneFieldV: UIView!
    
    
    
    // MARK: - Override Function

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
   
    @IBAction func actionOnContinue() {
        let nectVc = PointerTabBarControllerVC.instantiateFromStoryboard()
        navigationController?.pushViewController(nectVc, animated: true)
    }
    
    func setupViews(){
        phoneV.setCornerRadius(radius: 10)
        mainPhoneFieldV.setCornerRadius(radius: 10)
        continueeV.setCornerRadius(radius: 16)
    }
    
    
    
}
