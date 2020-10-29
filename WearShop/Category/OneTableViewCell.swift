//
//  OneTableViewCell.swift
//  WearShop
//
//  Created by Роман далинкевич on 15.07.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import UIKit

class OneTableViewCell: UITableViewCell {

    
    @IBOutlet var categoryImage: UIImageView!
    @IBOutlet var categoryLabel: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func initCellCategories(item: Category) {
        categoryLabel.text = item.name
       
        let stringImgUrl = "https://blackstarshop.ru/\(item.image)"
        let imgURL = URL(string: stringImgUrl)
        ImageService.getImage(withURL: imgURL!) { image in
            self.categoryImage.image = image
            
        }
    }
    
    func initCellSubcategories(item: Subcategories) {
        categoryLabel.text = item.name
        
        let stringImgUrl = "https://blackstarshop.ru/\(item.iconImage)"
        let imgURL = URL(string: stringImgUrl)
        ImageService.getImage(withURL: imgURL!) { image in
            self.categoryImage.image = image
        }
    }
    
}
