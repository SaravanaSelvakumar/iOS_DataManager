//
//  CartVC.swift
//  Pointer
//
//  Created by Apzzo Technologies Private Limited on 24/06/24.
//

import Foundation
import UIKit
import Alamofire

class CartVC: UIViewController {
    
    static let name = "CartVC"
    static let storyBoard = "Cart"
    
    /// The caller of this class does not need to know how we instantiate it.
    /// We simply return the instantiated class to the caller and they invoke it how they want
    /// If the as! fails, it will fail upon immediate testing
    class func instantiateFromStoryboard() -> CartVC {
        let vc = UIStoryboard(name: CartVC.storyBoard, bundle: nil).instantiateViewController(withIdentifier: CartVC.name) as! CartVC
        return vc
    }
    

    @IBOutlet var searchView: UIView!
    
    
    var name = ["Featured Products", "Popular Products", "Top Deals", "Rent", "Featured Products", "Popular Products", "Top Deals"]
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibCell()
        setupViews()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: true)
      
    }
    
    
    /// Register TableView Cell
    func registerNibCell() {
    
    }
    
    
    @IBAction func actionOnBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupViews() {
        
    }
    
}
