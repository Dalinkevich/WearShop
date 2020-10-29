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
    
    var subcategories : [Subcategories] = []
        
    @IBOutlet var categoryTableView: UITableView!
    
    @IBOutlet var backButton: UIButton!
    
    @IBOutlet var backBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loader  = CategoriesLoader()
        loader.delegate = self
        loader.loadCategories()
        categoryTableView.reloadData()

      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    @IBAction func backPressed(_ sender: UIButton) {
        subcategories = []
        categoryTableView.reloadData()
        
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProductListSegue",
            let dvc = segue.destination as? ProductListViewController,
            let id = sender as? Int {
            
            dvc.id = id
        }
    }
}



extension CategoryViewController: CategoriesLoaderDelegate {
    func loaded(categories: [Category]) {
        self.categories = categories
        categoryTableView.reloadData()
        
    }
}


extension CategoryViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if subcategories.count > 0 {
            backButton.isHidden = false
            return subcategories.count
        } else {
            backButton.isHidden = true
            return categories.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OneTableViewCell") as! OneTableViewCell
        
        if subcategories.count > 0 {
            cell.initCellSubcategories(item: subcategories[indexPath.row])
            
            
        } else {
            cell.initCellCategories(item: categories[indexPath.row])
        }
   
        return cell
   
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if subcategories.count > 0 {
            performSegue(withIdentifier: "ProductListSegue", sender: subcategories[indexPath.row].id)
            
            
        } else {
            subcategories = categories[indexPath.row].getSubCategory()
        tableView.reloadData()
        
        }
        categoryTableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}
 
  



