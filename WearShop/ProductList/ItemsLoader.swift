//
//  ItemsLoader.swift
//  WearShop
//
//  Created by Роман далинкевич on 12.09.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import Foundation

protocol ItemsLoaderDelegate {
    func loaded(items: [Items])
}

class ItemsLoader {
    
    var delegate: ItemsLoaderDelegate?

    
    func loadItems(idCat: Int) {
        let url = URL(string: "http://blackstarshop.ru/index.php?route=api/v1/products&cat_id=\(idCat)")!
    
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                let jsonDict = json as? NSDictionary {

                var items: [Items] = []
                for (_, data) in jsonDict where data is NSDictionary {
                    if let itm = Items(data: data as! NSDictionary) {
                        items.append(itm)
                    }
                }
                DispatchQueue.main.async {
                    self.delegate?.loaded(items: items)
                }
            }
        }
    
        task.resume()
    
    }
    
}
