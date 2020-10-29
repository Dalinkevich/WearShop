//
//  Product.swift
//  WearShop
//
//  Created by Роман далинкевич on 01.09.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.


import Foundation

class Product {
        let name: String
        let englishName: String
        let sortOrder: String
        let article: String
// MARK: как записать ?
//        "collection": null,
        let description: String
        let colorName: String
        let colorImageURL: String
        let mainImage: String
        let productImages: NSArray
        let offers: NSArray
        let recommendedProductIDs: NSArray
        let instagramPhotos: NSArray
        let price: String
        let tag: String
        let attributes: NSArray




    init?(data: NSDictionary) {
        guard let name = data["name"] as? String,
              let englishName = data["englishName"] as? String,
              let sortOrder = data["sortOrder"] as? String,
              let article = data["article"] as? String,
              let description = data["description"] as? String,
              let colorName = data["colorName"] as? String,
              let colorImageURL = data["colorImageURL"] as? String,
              let mainImage = data["mainImage"] as? String,
              let productImages = data["productImages"] as? NSArray,
              let offers = data["offers"] as? NSArray,
              let recommendedProductIDs = data["recommendedProductIDs"] as? NSArray,
              let instagramPhotos = data["instagramPhotos"] as? NSArray,
              let price = data["price"] as? String,
              let tag = data["tag"] as? String,
              let attributes = data["attributes"] as? NSArray else {

                return nil
        }


        self.name = name
        self.englishName = englishName
        self.sortOrder = sortOrder
        self.article = article
        self.description = description
        self.colorName = colorName
        self.colorImageURL = colorImageURL
        self.mainImage = mainImage
        self.productImages = productImages
        self.offers = offers
        self.recommendedProductIDs = recommendedProductIDs
        self.instagramPhotos = instagramPhotos
        self.price = price
        self.tag = tag
        self.attributes = attributes

    }

    func getProductImages() -> [ProductImages] {
        var prodImages = [ProductImages]()
        for item in productImages {
            if let pI = item as? NSDictionary,
                let dataPI = ProductImages(data: pI) {
                prodImages.append(dataPI)
            }
        }
        return prodImages
    }

    func getOffers() -> [Offers] {
        var off = [Offers]()
        for item in offers {
            if let of = item as? NSDictionary,
                let dataOffers = Offers(data: of) {
                off.append(dataOffers)
            }
        }
        return off
    }

    func getAttributes() -> [Attributes] {
        var attrib = [Attributes]()
        for item in attributes {
            if let atr = item as? NSDictionary,
                let dataAttributes = Attributes(data: atr) {
                attrib.append(dataAttributes)
            }
        }
        return attrib
    }

}



class ProductImages {
    let imageURL: String
    let sortOrder: String

    init?(data: NSDictionary) {
        guard let imageURL = data["imageURL"] as? String,
              let sortOrder = data["sortOrder"] as? String else {

                return nil
        }

        self.imageURL = imageURL
        self.sortOrder = sortOrder

    }

}

class Offers {
    let size: String
    let productOfferID: String
    let quantity: String

    init?(data: NSDictionary) {
        guard let size = data["size"] as? String,
              let productOfferID = data["productOfferID"] as? String,
            let quantity = data["quantity"] as? String else {

                return nil
        }

        self.size = size
        self.productOfferID = productOfferID
        self.quantity = quantity
    }

}

class InstagramPhotos {

}

class Attributes {
    let декоративныйЭлемент: String
    let рисунок: String
    let сезон: String
    let состав: String
    let странаПроизводителя: String
    let уходЗаВещами: String

    init?(data: NSDictionary) {
        guard let декоративныйЭлемент = data["Декоративный элемент"] as? String,
              let рисунок = data["Рисунок"] as? String,
              let сезон = data["Сезон"] as? String,
              let состав = data["Состав"] as? String,
              let странаПроизводителя = data["Страна производителя"] as? String,
              let уходЗаВещами = data["Уход за вещами"] as? String else {

                return nil
        }

        self.декоративныйЭлемент = декоративныйЭлемент
        self.рисунок = рисунок
        self.сезон = сезон
        self.состав = состав
        self.странаПроизводителя = странаПроизводителя
        self.уходЗаВещами = уходЗаВещами
    }
}
// MARK:Записать его просто как массив строк ? let recommendedProductIDs: NSArray

//        "recommendedProductIDs": [
//            "7509_359",
//            "7235_250",
//            "7288_4736",
//            "7510_219",
//            "7153_359",
//            "7290_282"
//        ],

//MARK: тут сделал просто пустой класс
//        "instagramPhotos": [],

//MARK: Не знал как быть с русским сделал по типу предидущих

//        "attributes": [
//            {
//                "Декоративный элемент": "нашивка"
//            },
//            {
//                "Рисунок": " надпись"
//            },
//            {
//                "Сезон": "круглогодичный"
//            },
//            {
//                "Состав": "100% хлопок"
//            },
//            {
//                "Страна производителя": "Россия"
//            },
//            {
//                "Уход за вещами": "бережная стирка при 30 градусах"
//            }
//        ]
//    }
//}

//
//
//MARK: JSON
//
//"7052_219": {
//    "name": "Худи BS HALF",
//    "englishName": "BS HALF hoodie",
//    "sortOrder": "16",
//    "article": "MA0219-083",
//    "collection": null,
//    "description": "У&nbsp;Худи BS HALF есть три контурные белые надписи: спереди у кармана-кенгуру мы видим BLACK, на обратной стороне симметрично STAR и на капюшоне минималистичная надпись Black Star your only limit is your mind. Мы&nbsp; обожаем мотивационные надписи на одежде, потому что знаем, что наши люди за внутренний рост и саморазвитие! Становитесь лучшей версией себя вместе с Black Star!",
//    "colorName": "Черный",
//    "colorImageURL": "image/catalog/style/color/black_000000.jpg",
//    "mainImage": "image/cache/catalog/p/7052/9t0a8832-h_1_630x840.jpg",
//    "productImages": [
//        {
//            "imageURL": "image/cache/catalog/p/7052/9t0a8835-h_1_630x840.jpg",
//            "sortOrder": "1"
//        },
//        {
//            "imageURL": "image/cache/catalog/p/7052/9t0a8837-h_1_630x840.jpg",
//            "sortOrder": "2"
//        },
//        {
//            "imageURL": "image/cache/catalog/p/7052/9t0a8836-h_1_630x840.jpg",
//            "sortOrder": "3"
//        },
//        {
//            "imageURL": "image/cache/catalog/p/7052/9t0a8838-h_1_630x840.jpg",
//            "sortOrder": "4"
//        },
//        {
//            "imageURL": "image/cache/catalog/p/7052/9t0a8879-h_1_630x840.jpg",
//            "sortOrder": "5"
//        },
//        {
//            "imageURL": "image/cache/catalog/p/7052/9t0a8881-h_1_630x840.jpg",
//            "sortOrder": "6"
//        },
//        {
//            "imageURL": "image/cache/catalog/p/7052/9t0a8882-h_1_630x840.jpg",
//            "sortOrder": "7"
//        },
//        {
//            "imageURL": "image/cache/catalog/p/7052/9t0a8884-h_1_630x840.jpg",
//            "sortOrder": "8"
//        }
//    ],
//    "offers": [
//        {
//            "size": "XS",
//            "productOfferID": "37180",
//            "quantity": "1"
//        },
//        {
//            "size": "L",
//            "productOfferID": "37186",
//            "quantity": "2"
//        }
//    ],
//    "recommendedProductIDs": [
//        "6947_219",
//        "6951_219",
//        "6901_219",
//        "7270_250",
//        "7499_219",
//        "7510_219"
//    ],
//    "instagramPhotos": [],
//    "price": "3900.0000",
//    "tag": "new",
//    "attributes": [
//        {
//            "Декоративный элемент": "принт"
//        },
//        {
//            "Рисунок": " надпись"
//        },
//        {
//            "Сезон": "круглогодичный"
//        },
//        {
//            "Состав": "100% хлопок"
//        },
//        {
//            "Страна производителя": "Россия"
//        },
//        {
//            "Уход за вещами": "бережная стирка при 30 градусах"
//        }
//    ]
//}
