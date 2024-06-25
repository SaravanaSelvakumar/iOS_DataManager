//
// CustomNavigationController.swift
// IOSLearningKit
//
// Created by Apzzo Technologies on 15/11/23.
//
import Foundation
import UIKit
class CustomNavigationController: UINavigationController {
  static let name = "CustomNavigationController"
  static let storyBoard = "CustomNavigationController"
  /// The caller of this class does not need to know how we instantiate it.
  /// We simply return the instantiated class to the caller and they invoke it how they want
  /// If the as! fails, it will fail upon immediate testing
  class func instantiateFromStoryboard() -> CustomNavigationController {
    let vc = UIStoryboard(name: CustomNavigationController.storyBoard, bundle: nil).instantiateViewController(withIdentifier: CustomNavigationController.name) as! CustomNavigationController
    return vc
  }
  // MARK: - Override Function
  override func viewDidLoad() {
    super.viewDidLoad()
      isNavigationBarHidden = true
    if #available(iOS 15, *) {
      let appearance = UINavigationBarAppearance()
//      navigationBar.tintColor = colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
      navigationBar.isTranslucent = false
      appearance.configureWithOpaqueBackground()
      appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
      appearance.backgroundColor = UIColor.white
      navigationBar.standardAppearance = appearance
      UINavigationBar.appearance().scrollEdgeAppearance = appearance
    } else {
      view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      navigationBar.isTranslucent = false
        navigationBar.tintColor = .white
      navigationBar.barTintColor = UIColor.white
//      navigationBar.titleTextAttributes = [
//        NSAttributedString.Key.font: UIFont, size: <#T##CGFloat#>),
//        0
//      ]
        view.backgroundColor = .white
    }
  }
}
