//
//  RealmImage.swift
//  WearShop
//
//  Created by Роман далинкевич on 20.10.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import Foundation
import RealmSwift

class RealmImage {
    
    static let shared = RealmImage()
    
    var realm = try! Realm()
    
    
    func save(item: Images) {
        
        try! realm.write {
            realm.add(item)
        }
    }
    
    func getItems() -> Results<Images> {
        realm.objects(Images.self)
    }
    
}
