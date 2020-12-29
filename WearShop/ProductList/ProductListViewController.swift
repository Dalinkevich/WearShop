//
//  ProductListViewController.swift
//  WearShop
//
//  Created by Роман далинкевич on 01.09.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    var items: [Items] = []
    
    var id = 0
    
    @IBOutlet var productCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loader = ItemsLoader()
        loader.delegate = self
        loader.loadItems(idCat: id)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProductCardSegue",
            let dvc = segue.destination as? ProductCardViewController,
            let item = sender as? Items {
            
            dvc.item = item
        
        }
    }
    
}
  

extension ProductListViewController: ItemsLoaderDelegate {
    func loaded(items: [Items]) {
        self.items = items
        productCollectionView.reloadData()
    }
    
}


extension ProductListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = UIScreen.main.bounds.size.width / 2 - 20
        return CGSize(width: w, height: w)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductListCollectionViewCell", for: indexPath) as! ProductListCollectionViewCell
        cell.initCellItems(item: items[indexPath.row])

        return cell
    }
     
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ProductCardSegue", sender: items[indexPath.row])
    }
   
}
