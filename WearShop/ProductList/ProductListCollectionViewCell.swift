//
//  ProductListCollectionViewCell.swift
//  WearShop
//
//  Created by Роман далинкевич on 01.09.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import UIKit

class ProductListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.numberOfLines = 0
        
    }
    
    func initCellItems(item: Items) {
        nameLabel.text = item.name
        priceLabel.text = "₽\(item.price)"
        
        let stringImgUrl = "https://blackstarshop.ru/\(item.mainImage)"
        let imgURL = URL(string: stringImgUrl)
        ImageService.downlaodImage(withURL: imgURL!) { image in
            self.productImageView.image = image
        }
    }
}


