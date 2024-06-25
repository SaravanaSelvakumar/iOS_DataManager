//
//  OfferTVC.swift
//  Pointer
//
//  Created by Apzzo Technologies Private Limited on 24/06/24.
//

import UIKit

class OfferTVC: UITableViewCell {
      
    @IBOutlet var offersCVC: UICollectionView!
    
    var offerImages = [
        Offers(offer: UIImage(named: "beachGlass")!),
        Offers(offer: UIImage(named: "groupGlass")!),
        Offers(offer: UIImage(named: "pinkGlass")!),
        Offers(offer: UIImage(named: "yellowGlass")!)
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        registerCell()
        offersCVC.delegate = self
        offersCVC.dataSource = self
        offersCVC.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func registerCell(){
        let offerNIb = UINib(nibName: "OfferCVC", bundle: nil)
        offersCVC.register(offerNIb,  forCellWithReuseIdentifier: "OfferCVC")
    }
    
}


extension OfferTVC: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offerImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCVC", for: indexPath) as! OfferCVC
        let product = offerImages[indexPath.item]
        cell.configure(with: product.offer)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: screenWidth, height: 155)
    }


}
