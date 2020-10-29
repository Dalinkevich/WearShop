//
//  ProductCardViewController.swift
//  WearShop
//
//  Created by Роман далинкевич on 23.09.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import UIKit

class ProductCardViewController: UIViewController {

    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var cardTextView: UITextView!
    
    @IBOutlet var productImageView: UIImageView!
    
    @IBOutlet var cardButton: UIButton!
    
    var item: Items!
     
    var items = ProductCart()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardButton.layer.cornerRadius = 15
        cardButton.layer.borderWidth = 3
        cardButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        
        priceLabel.text = "₽\(item.price)"
        nameLabel.text = item.name
        cardTextView.text = item.description
        initCellItems(item: item)
       
        items.name = item.name
        items.price = item.price
        items.imageUrl = item.mainImage
        
    }

    @IBAction func addToProduct(_ sender: UIButton) {
        RealmManager.shared.save(item: items)

    }
    
    func initCellItems(item: Items) {
        let stringImgUrl = "https://blackstarshop.ru/\(item.mainImage)"
        
        DispatchQueue.main.async {
            if let imgURL = URL(string: stringImgUrl) {
                if let data = NSData(contentsOf: imgURL) {
                    self.productImageView.image = UIImage(data: data as Data)
                }
            }
        }
    }
    
}




