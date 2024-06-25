//
//  ViewController.swift
//  Pointer
//
//  Created by Apzzo Technologies Private Limited on 19/06/24.
//

import UIKit

class SplashVC: UIViewController {


static let name = "SplashVC"
static let storyBoard = "Main"

/// The caller of this class does not need to know how we instantiate it.
/// We simply return the instantiated class to the caller and they invoke it how they want
/// If the as! fails, it will fail upon immediate testing
class func instantiateFromStoryboard() -> SplashVC {
    let vc = UIStoryboard(name: SplashVC.storyBoard, bundle: nil).instantiateViewController(withIdentifier: SplashVC.name) as! SplashVC
    return vc
}

    @IBOutlet var profileViews: UIView!
    
// MARK: - Override Function

override func viewDidLoad() {
    super.viewDidLoad()
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
           Utils.setRootController(rootVCType: .loginVC)
       }
    
}

override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
//    Utils.setRootController(rootVCType: .loginVC)
}

override func viewDidAppear(_ animated: Bool) {
super.viewDidAppear(animated)
    
}

func fetchUserServerCall() {
}
    
    
    
}

