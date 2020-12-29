//
//  DatasWear.swift
//  WearShop
//
//  Created by Роман далинкевич on 03.08.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//
//


import Foundation

class Category {
    let name: String
    let sortOrder: Int
    let image: String
    let iconImage: String
    let iconImageActive: String
    let subcategories: NSArray

    init?(data: NSDictionary) {
        guard let name = data["name"] as? String,
              let sortOrder = data["sortOrder"] as? String,
              let image = data["image"] as? String,
              let iconImage = data["iconImage"] as? String,
              let iconImageActive = data["iconImageActive"] as? String,
              let subcategories = data["subcategories"] as? NSArray else {
            
              return nil
        }
        
        self.name = name
        self.sortOrder = Int(sortOrder) ?? 0
        self.image = image
        self.iconImage = iconImage
        self.iconImageActive = iconImageActive
        self.subcategories = subcategories
        
        }
    
    func getSubCategory() -> [Subcategories] {
        var subCat = [Subcategories]()
        for item in subcategories {
            if let sc  = item as? NSDictionary,
                let dataSC = Subcategories(data: sc) {
                subCat.append(dataSC)
            }
        }
        return subCat
    }
    
}

class Subcategories {
    let id: Int
    let iconImage: String
    let sortOrder: Int
    let name: String
    
    
    init?(data: NSDictionary) {
        guard let id = data["id"] as? String,
              let iconImage = data["iconImage"] as? String,
              let sortOrder = data["sortOrder"] as? String,
              let name = data["name"] as? String else {
            
                return nil
        }
        self.id = Int(id) ?? 0
        self.iconImage = iconImage
        self.sortOrder = Int(sortOrder) ?? 0
        self.name = name
    }
    
}


