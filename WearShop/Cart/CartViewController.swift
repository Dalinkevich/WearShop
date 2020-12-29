//
//  CartViewController.swift
//  WearShop
//
//  Created by Роман далинкевич on 26.09.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet var cartTableView: UITableView!
    
    @IBOutlet var cartSum: UILabel!
    
    var cart = RealmManager.shared.getItems()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cart = RealmManager.shared.getItems()
        cartTableView.reloadData()
    
    }
       
}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cart.count == 0 {
           cartSum.text = "Cart is empty"
        } else {
            sum()
        }
        return cart.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.selectionStyle = .none
        
        let item = cart[indexPath.row]

            cell.countLabel.text = "\(item.count)"
            cell.sizeLabel.text = item.size
            cell.nameLabel.text = item.name
            cell.priceLabel.text = item.price
            cell.initProducrt(item: item)
        

        sum()
        
        return cell
    }
    
    
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            
           RealmManager.shared.remove(index: indexPath.row)
            
           cartTableView.deleteRows(at: [IndexPath.init(row: indexPath.row, section: 0)], with: .automatic)

           cartTableView.reloadData()
        }
        
    }
    
    func sum() {

        var sum: Int = 0

        for el in cart {
            let a = Double(el.price)
            let b = Int(a!)
            
            if el.count > 1 {
                sum += (b * el.count)
            } else {
                sum += b
            }
            cartSum.text = "Total: \(sum)₽"
        }
    }
 
}

