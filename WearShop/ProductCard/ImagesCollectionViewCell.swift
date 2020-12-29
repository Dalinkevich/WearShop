//
//  ImagesCollectionViewCell.swift
//  WearShop
//
//  Created by Роман далинкевич on 30.10.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var collectionImageView: UIImageView!
    
    
    func initCellItems(item: ProductImages) {

        let stringImgUrl = "https://blackstarshop.ru/\(item.imageURL)"
        let imgURL = URL(string: stringImgUrl)
        ImageService.downlaodImage(withURL: imgURL!) { image in
            self.collectionImageView.image = image
        }
    }
    
    func initCellItems2(item: Items) {

        let stringImgUrl = "https://blackstarshop.ru/\(item.mainImage)"
        let imgURL = URL(string: stringImgUrl)
        ImageService.downlaodImage(withURL: imgURL!) { image in
            self.collectionImageView.image = image
        }
    }
    
}
