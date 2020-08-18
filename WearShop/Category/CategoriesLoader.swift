//
//  Response.swift
//  WearShop
//
//  Created by Роман далинкевич on 03.08.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import Foundation

protocol CategoriesLoaderDelegate {
    func loaded(categories: [Category])
    
}

class CategoriesLoader {
    
    
    var delegate: CategoriesLoaderDelegate?
    
    func loadCategories() {
        let url = URL(string: "http://blackstarshop.ru/index.php?route=api/v1/categories")!
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                let jsonDict = json as? NSDictionary {
                
                var categories: [Category] = []
                
                for (_, data) in jsonDict where data is NSDictionary {
                    if let category = Category(data: data as! NSDictionary) {
                        categories.append(category)
                        
                    }
                    
                }
                

                
                
                DispatchQueue.main.async {
                    self.delegate?.loaded(categories: categories)
                }
                
            }
        }
        task.resume()
    }
  
    

}

