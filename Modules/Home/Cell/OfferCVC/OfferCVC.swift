//
//  OfferCVC.swift
//  Pointer
//
//  Created by Apzzo Technologies Private Limited on 21/06/24.
//

import UIKit

class OfferCVC: UICollectionViewCell {
    
    @IBOutlet weak var offerIV: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with image: UIImage) {
            offerIV.image = image
        }

}

struct Offers {
    var offer: UIImage
}
