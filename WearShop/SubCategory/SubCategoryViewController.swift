//
//  SubCategoryViewController.swift
//  WearShop
//
//  Created by Роман далинкевич on 07.08.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import UIKit

class SubCategoryViewController: UIViewController {

    @IBOutlet var TwoTableView: UITableView!
    
    var subcategories: [Subcategories] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loader2 = SubcategoriesLoader()
        loader2.delegate = self
        loader2.loadCategories()

        
    }

}


extension SubCategoryViewController: SubcategoriesLoaderDelegate {
    func loaded(subcategories: [Subcategories]) {
        self.subcategories = subcategories
        TwoTableView.reloadData()
    }
    
   
    }
    
    



extension SubCategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subcategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "TwoTableViewCell") as! TwoTableViewCell
        
        let datas2 = subcategories[indexPath.row]
        cell2.subcategoryLabel.text = datas2.name
        
        return cell2
    }
    
    
}
