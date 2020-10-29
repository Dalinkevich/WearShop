//
//  SubcategoryLoader.swift
//  WearShop
//
//  Created by Роман далинкевич on 07.08.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//
//
//import Foundation

import Foundation

protocol SubcategoriesLoaderDelegate {
    func loaded(subcategories: [Category])
    
}

class SubcategoriesLoader {
    
    
    var delegate: SubcategoriesLoaderDelegate?
    
    func loadCategories() {
        let url = URL(string: "http://blackstarshop.ru/index.php?route=api/v1/categories")!
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                let jsonDict = json as? NSDictionary {
                
                var subcategories: [Category] = []

                for (_, data) in jsonDict where data is NSDictionary {
                    if let subcategory = Category(data: data as! NSDictionary) {
                        subcategories.append(subcategory)
                        
                    }
                    
                }
                

                
                
                DispatchQueue.main.async {
                    self.delegate?.loaded(subcategories: subcategories)
                }
                
            }
        }
        task.resume()
    }
  
    

}
