//
//  SizeTableViewCell.swift
//  WearShop
//
//  Created by Роман далинкевич on 10.11.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import UIKit

class SizeTableViewCell: UITableViewCell {

    @IBOutlet var sizeLabel: UILabel!
    
    @IBOutlet var addSizeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func initCellOffers(item: Offers) {
        sizeLabel.text = "\(item.size)"
    }

}
