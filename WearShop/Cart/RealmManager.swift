//
//  RealmManager.swift
//  WearShop
//
//  Created by Роман далинкевич on 05.10.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    
    var realm = try! Realm()
    
    
    func save(item: ProductCart) {
        try! realm.write {
            realm.add(item)
        }
    }
    
    func getItems() -> Results<ProductCart> {
        realm.objects(ProductCart.self)
    }
    
    func remove(index: Int) {
        let item = realm.objects(ProductCart.self)[index]
        try! realm.write {
            realm.delete(item)
        }
    }
    
}

