//
//  CartTableViewCell.swift
//  WearShop
//
//  Created by Роман далинкевич on 30.09.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var productImageView: UIImageView!
    
    @IBOutlet var sizeLabel: UILabel!
    
    @IBOutlet var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        priceLabel.lineBreakMode = .byCharWrapping
        nameLabel.lineBreakMode  = .byWordWrapping
        sizeLabel.lineBreakMode  = .byWordWrapping
        nameLabel.numberOfLines  = 0
        sizeLabel.numberOfLines  = 0

    }
    

    func initProducrt(item: ProductCart) {
        let stringImgUrl = "https://blackstarshop.ru/\(item.imageUrl)"
        let imgURL = URL(string: stringImgUrl)
        ImageService.getImage(withURL: imgURL!) { image in
            self.productImageView.image = image
            
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
