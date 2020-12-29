//
//  SizeTableViewController.swift
//  WearShop
//
//  Created by Роман далинкевич on 10.11.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import UIKit

class SizeTableViewController: UIViewController {

    var item: Items!
    
    @IBOutlet var sizeTableView: UITableView!
    
    var sizeArray: [Offers] = []
    
    var items = ProductCart()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sizeArray = item.getOffers()
            
        items.name = item.name
        items.price = item.price
        items.imageUrl = item.mainImage
        
        sizeTableView.reloadData()
        
    }

}


extension SizeTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sizeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sizeCell", for: indexPath) as! SizeTableViewCell
        cell.initCellOffers(item: sizeArray[indexPath.row])
                
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.items.size = sizeArray[indexPath.row].size
        RealmManager.shared.saveNew(item: items)
        
        
        sizeTableView.deselectRow(at: indexPath, animated: true)
        navigationController?.popViewController(animated: true)

    }

}



