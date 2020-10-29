//
//  Items.swift
//  WearShop
//
//  Created by Роман далинкевич on 12.09.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import Foundation



class Items {
    
    let article: String
    let attributes: NSArray
    let colorImageURL: String
    let colorName: String
    let description: String
    let englishName: String
    let mainImage: String
    let name: String
    let offers: NSArray
 
    let price: String
    let productImages: NSArray
    let recommendedProductIDs: NSArray
    let sortOrder: Int
  
    
    
    init?(data: NSDictionary) {
        guard let article = data["article"] as? String,
              let attributes = data["attributes"] as? NSArray,
              let colorImageURL = data["colorImageURL"] as? String,
              let colorName = data["colorName"] as? String,
              let description = data["description"] as? String,
              let englishName = data["englishName"] as? String,
              let mainImage = data["mainImage"] as? String,
              let name = data["name"] as? String,
              let offers = data["offers"] as? NSArray,
          
              let price = data["price"] as? String,
              let productImages = data["productImages"] as? NSArray,
              let recommendedProductIDs = data["recommendedProductIDs"] as? NSArray,
              let sortOrder = data["sortOrder"] as? String else {
              
                
                return nil
        }
        self.article = article
        self.attributes = attributes
        self.colorImageURL = colorImageURL
        self.colorName = colorName
        self.description = description
        self.englishName = englishName
        self.mainImage = mainImage
        self.name = name
        self.offers = offers
      
        self.price = price
        self.productImages = productImages
        self.recommendedProductIDs = recommendedProductIDs
        self.sortOrder = Int(sortOrder) ?? 0
        
        
    }
    
    
    
    func getOffers() -> [Offers] {
        var off = [Offers]()
        for item in offers {
            if let of = item as? NSDictionary,
                let dataOff = Offers(data: of) {
                off.append(dataOff)
            }
        }
        return off

    }
    
    func getProductImages() -> [ProductImages] {
        var prodIm = [ProductImages]()
        for item in productImages {
            if let prIm = item as? NSDictionary,
                let dataProductImages = ProductImages(data: prIm) {
                prodIm.append(dataProductImages)
            }
        }
        return prodIm
    }

}

class Offers {
    let productOfferID: Int
    let quantity: Int


    init?(data: NSDictionary) {
        guard let productOfferID = data["productOfferID"] as? String,
              let quantity = data["quantity"] as? String else {

                return nil
        }
        self.productOfferID = Int(productOfferID) ?? 0
        self.quantity = Int(quantity) ?? 0

    }

}

class ProductImages {
    let imageURL: String
    let sortOrder: Int

    init?(data: NSDictionary) {
        guard let imageURL = data["imageURL"] as? String,
              let sortOrder = data["sortOrder"] as? String else {

                return nil
        }
        self.imageURL = imageURL
        self.sortOrder = Int(sortOrder) ?? 0
    }
    
}
