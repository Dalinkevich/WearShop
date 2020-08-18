//
//  CategoryViewController.swift
//  WearShop
//
//  Created by Роман далинкевич on 04.08.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    
    
    var categories: [Category] = []
    
    @IBOutlet var categoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loader  = CategoriesLoader()
        loader.delegate = self
        loader.loadCategories()
        
    }
    
}

extension CategoryViewController: CategoriesLoaderDelegate {
    func loaded(categories: [Category]) {
        self.categories = categories
        categoryTableView.reloadData()
    }
    
}


extension CategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OneTableViewCell") as! OneTableViewCell
        
        let datas = categories[indexPath.row]
        cell.categoryLabel.text = datas.name
        
       
   
        let stringImgURL = "https://blackstarshop.ru/\(datas.image)"
        
        if let imgURL = URL(string: stringImgURL) {

            if let data = NSData(contentsOf: imgURL) {

                cell.categoryImage.image = UIImage(data: data as Data)
            }
        }
        
        return cell
        
    }
   
  
}

//проверка GIT
