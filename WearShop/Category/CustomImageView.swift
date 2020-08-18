//
//  CustomImageView.swift
//  WearShop
//
//  Created by Роман далинкевич on 06.08.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import Foundation
import UIKit

class CustomImageView: UIImageView {
    
    func loadImage(from url: URL) {
        image = nil
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard
                let data = data, error == nil,
                let newImage = UIImage(data: data)
            else {
                print("couldn't load image from url: \(url)" )
                return
            }
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
        task.resume()
    }
}
