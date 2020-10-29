//
//  CartItem.swift
//  WearShop
//
//  Created by Роман далинкевич on 01.10.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import Foundation
import RealmSwift

class CartItem: Object {
    @objc dynamic var name = ""
    @objc dynamic var price = ""
    @objc dynamic var done = false
    @objc dynamic var image = UIImage()
}
