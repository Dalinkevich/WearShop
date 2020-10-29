//
//  ProductCardCollectionViewCell.swift
//  WearShop
//
//  Created by Роман далинкевич on 25.09.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import UIKit

class ProductCardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cardImageView: UIImageView!
    
    
    func initCellItems(item: ProductImages) {
        let stringImgUrl = "https://blackstarshop.ru/\(item.imageURL)"
    
    DispatchQueue.main.async {
        if let imgURL = URL(string: stringImgUrl) {
            if let data = NSData(contentsOf: imgURL) {
                self.cardImageView.image = UIImage(data: data as Data)
            }
        }
    }
    
}
}
