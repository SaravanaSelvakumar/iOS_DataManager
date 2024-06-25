
import Foundation
import UIKit

class PointerTabBarControllerVC: UITabBarController {
    
    static let name = "PointerTabBarControllerVC"
    static let storyBoard = "PointerTabBarController"

    /// The caller of this class does not need to know how we instantiate it.
    /// We simply return the instantiated class to the caller and they invoke it how they want
    /// If the as! fails, it will fail upon immediate testing
    class func instantiateFromStoryboard() -> PointerTabBarControllerVC {
        let vc = UIStoryboard(name: PointerTabBarControllerVC.storyBoard, bundle: nil).instantiateViewController(withIdentifier: PointerTabBarControllerVC.name) as! PointerTabBarControllerVC
        return vc
    }

    // MARK: - Override Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        setupViews()
    }
}


extension PointerTabBarControllerVC {
    
    
    /// It will enhance to UI
    func setupViews() {
        tabBar.isTranslucent = false
        tabBar.backgroundColor = PointerColor(.white).instance
        tabBar.barTintColor = PointerColor(.white).instance
        createTabbarControllers()
        overrideUserInterfaceStyle = .light
        tabBar.clipsToBounds = true

        tabBar.layer.shadowColor = PointerColor(.shadow).instance.cgColor
        tabBar.layer.shadowOpacity = 0.5
        tabBar.layer.shadowOffset = CGSize.zero
        tabBar.layer.shadowRadius = 5
        tabBar.tintColor = UIColor(hexStr: "37AB49")
        tabBar.layer.borderColor = UIColor.clear.cgColor
        tabBar.layer.borderWidth = 0
        tabBar.clipsToBounds = false
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
    }

    
    private func createTabbarControllers() {
        
        var HomeVC = CustomNavigationController(rootViewController: HomeVC.instantiateFromStoryboard())
        HomeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named:  "home"), tag: 1)
        HomeVC.tabBarItem.selectedImage = UIImage(named:  "homeSel")
        

        var CategoryVC = CustomNavigationController(rootViewController: CategoryVC.instantiateFromStoryboard())
        CategoryVC.tabBarItem = UITabBarItem(title: "Category".localized, image: UIImage(named: "category"), tag: 2)
        CategoryVC.tabBarItem.selectedImage = UIImage(named:  "categorySel")
       

        var CartVC = CustomNavigationController(rootViewController: CartVC.instantiateFromStoryboard())
        CartVC.tabBarItem = UITabBarItem(title: "Cart".localized, image: UIImage(named: "cart"), tag: 3)
        CartVC.tabBarItem.selectedImage = UIImage(named:  "cartSel")
        

        var NotificationVC = CustomNavigationController(rootViewController: NotificationVC.instantiateFromStoryboard())
        NotificationVC.tabBarItem = UITabBarItem(title: "Notification".localized, image: UIImage(named: "notification"), tag: 4)
        NotificationVC.tabBarItem.selectedImage = UIImage(named:  "notificationSel")
        

        var SettingsVC = CustomNavigationController(rootViewController: SettingsVC.instantiateFromStoryboard())
        SettingsVC.tabBarItem = UITabBarItem(title: "Settings".localized, image: UIImage(named: "setting"), tag: 5)
        SettingsVC.tabBarItem.selectedImage = UIImage(named:  "settingSel")
        

        viewControllers = [HomeVC, CategoryVC, CartVC, NotificationVC, SettingsVC]
        selectedIndex = 0

    }
    
    
}

