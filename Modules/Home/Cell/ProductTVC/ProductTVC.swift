//
//  ProductTVC.swift
//  Pointer
//
//  Created by Apzzo Technologies Private Limited on 19/06/24.
//

import UIKit

class ProductTVC: UITableViewCell {
    
    
    @IBOutlet var productL: UILabel!
    @IBOutlet weak var productCV: UICollectionView!
    
 
        var product:[Products] = [
            Products(productName: "Product 1", productDescription: "Description", productRating: "4", productReview: "(1282)", productPrice: "₹999", discount: "₹5,999", image: UIImage(named: "apostolos_Img")!),
            Products(productName: "Product 2", productDescription: "Description", productRating: "5", productReview: "(182)", productPrice: "₹999", discount: "₹2,999", image: UIImage(named: "apostolos")!),
            Products(productName: "Product 3", productDescription: "Description", productRating: "5", productReview: "(1082)", productPrice: "₹999", discount: "₹999", image: UIImage(named: "joshua")!),
            Products(productName: "Product 4", productDescription: "Description", productRating: "3", productReview: "(12)", productPrice: "₹999", discount: "40%", image: UIImage(named: "giorgio")!),
            Products(productName: "Product 5", productDescription: "Description", productRating: "4", productReview: "(122)", productPrice: "₹999", discount: "50%", image: UIImage(named: "laura")!),
            Products(productName: "Product 5", productDescription: "Description", productRating: "5", productReview: "(82)", productPrice: "₹999", discount: "50%", image: UIImage(named: "anton")!)
        ]

    override func awakeFromNib() {
        super.awakeFromNib()
        registerNibCell()
        productCV.delegate = self
        productCV.dataSource = self
        productCV.reloadData()
    }

    
    func registerNibCell() {
        let OfferCVC = UINib(nibName: "ProductCVC", bundle: nil)
        productCV.register(OfferCVC, forCellWithReuseIdentifier: "ProductCVC")
    }
    
}

extension ProductTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCVC", for: indexPath) as! ProductCVC
           let product = product[indexPath.item]
        cell.configureCell(product: product)
           return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 182, height: 310)
    }
}

