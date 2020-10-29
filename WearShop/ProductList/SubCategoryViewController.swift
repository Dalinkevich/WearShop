//
//  SubCategoryViewController.swift
//  WearShop
//
//  Created by Роман далинкевич on 07.08.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//
//
//import UIKit
//
//
//class SubCategoryViewController: UIViewController{
//
//    @IBOutlet var TwoTableView: UITableView!
//    
//    var subcategories: [Subcategories] = []
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//    }
//}
//
//
//
//
//extension SubCategoryViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return subcategories.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell2 = tableView.dequeueReusableCell(withIdentifier: "TwoTableViewCell") as! TwoTableViewCell
//        
//        cell2.subcategoryLabel.text = subcategories[indexPath.row].name
//        
//        let datas2 = subcategories[indexPath.row]
//        let stringImgURL2 = "https://blackstarshop.ru/\(datas2.iconImage)"
//        if let imjURL2 = URL(string: stringImgURL2) {
//            if let data2 = NSData(contentsOf: imjURL2) {
//                cell2.subcategoryImage.image = UIImage(data: data2 as Data)
//            }
//        }
//       
//        return cell2
//    }
//    
//    
//}
