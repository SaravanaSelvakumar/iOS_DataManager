//
//  HomeVC.swift
//  Pointer
//
//  Created by Apzzo Technologies Private Limited on 19/06/24.
//

import Foundation
import UIKit
import Alamofire

class HomeVC: UIViewController {
    
    static let name = "HomeVC"
    static let storyBoard = "Home"
    
    /// The caller of this class does not need to know how we instantiate it.
    /// We simply return the instantiated class to the caller and they invoke it how they want
    /// If the as! fails, it will fail upon immediate testing
    class func instantiateFromStoryboard() -> HomeVC {
        let vc = UIStoryboard(name: HomeVC.storyBoard, bundle: nil).instantiateViewController(withIdentifier: HomeVC.name) as! HomeVC
        return vc
    }
    
    
    @IBOutlet var productTableView: UITableView!
    @IBOutlet var searchView: UIView!
    
    
    var name = ["Featured Products", "Popular Products", "Top Deals", "Rent", "Featured Products", "Popular Products", "Top Deals"] 
    
    var offerImages = [
        Offers(offer: UIImage(named: "beachGlass")!),
        Offers(offer: UIImage(named: "groupGlass")!),
        Offers(offer: UIImage(named: "pinkGlass")!),
        Offers(offer: UIImage(named: "yellowGlass")!)
    ]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibCell()
        setupViews()
        productTableView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: true)
        productTableView.showsVerticalScrollIndicator = false
      
    }
    
    
    /// Register TableView Cell
    func registerNibCell() {
        let offerNib = UINib(nibName: "OfferTVC", bundle: nil)
        productTableView.register(offerNib, forCellReuseIdentifier: "OfferTVC")
        let productNib = UINib(nibName: "ProductTVC", bundle: nil)
        productTableView.register(productNib, forCellReuseIdentifier: "ProductTVC")
    }
    
    
    @IBAction func actionOnBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupViews() {
        searchView.setCornerRadius(radius: 10)
    }
    
}



extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return name.count
     }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let offerCell = tableView.dequeueReusableCell(withIdentifier: "OfferTVC", for: indexPath) as! OfferTVC
            return  offerCell
        } else {
            let productCell = tableView.dequeueReusableCell(withIdentifier: "ProductTVC", for: indexPath) as! ProductTVC
            productCell.productL.text = name[indexPath.row]
            return productCell
        }
    }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         if indexPath.row == 0 {
             return 155
         } else {
             return 370
         }
     }
        
}






