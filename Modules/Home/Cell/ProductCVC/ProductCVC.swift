//
//  ProductCVC.swift
//  Pointer
//
//  Created by Apzzo Technologies Private Limited on 19/06/24.
//

import UIKit

class Products{
    let productName: String
    let productDescription: String
    let productRating: String
    let productReview: String
    let productPrice: String
    let discount: String
    let image: UIImage
    var isselected = false
    
    init(productName: String, productDescription: String, productRating: String, productReview: String, productPrice: String, discount: String, image: UIImage, isselected: Bool = false) {
           self.productName = productName
           self.productDescription = productDescription
           self.productRating = productRating
           self.productReview = productReview
           self.productPrice = productPrice
           self.discount = discount
           self.image = image
           self.isselected = isselected
       }
}

class ProductCVC: UICollectionViewCell {
    
    
    @IBOutlet weak var productTypeIV: UIImageView!
    @IBOutlet weak var productNameL: UILabel!
    @IBOutlet weak var productDescriptionL: UILabel!
    @IBOutlet weak var ratingL: UILabel!
    @IBOutlet weak var reviewL: UILabel!
    @IBOutlet weak var productPriceL: UILabel!
    @IBOutlet weak var discountL: UILabel!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var addToCartView: UIView!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var productImageView: UIView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpViews()
    }
    
    func configureCell(product: Products) {
        productTypeIV.image = product.image
        productNameL.text = product.productName
        productDescriptionL.text = product.productDescription
        ratingL.text = product.productRating
        reviewL.text = product.productReview
        productPriceL.text = product.productPrice
        discountL.attributedText = product.discount.strikeThrough()
     }
    
    func setUpViews(){
        addToCartView.setCornerRadius(radius: 8, borderColor: UIColor(hexStr: "787878"), borderWidth: 1)
        ratingView.setCornerRadius(radius: 5)
        outerView.setCornerRadius(radius: 13, borderColor: UIColor(hexStr: "787878").withAlphaComponent(0.5), borderWidth: 1)
        productImageView.setCornerRadius(radius: 12)
    }

}
