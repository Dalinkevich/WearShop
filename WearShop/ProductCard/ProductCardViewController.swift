//
//  ProductCardViewController.swift
//  WearShop
//
//  Created by Роман далинкевич on 23.09.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import UIKit

class ProductCardViewController: UIViewController {

    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var cardTextView: UITextView!
  
    @IBOutlet var cardButton: UIButton!
    
    @IBOutlet var imageCollectionView: UICollectionView!
    
    var sizeArray: [Offers] = []

    var item: Items!
    
    var itemImages: [ProductImages] = []
    
    var images: [Items] = []
    
    var itemCart = ProductCart()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        priceLabel.text = "₽\(item.price)"
        nameLabel.text = item.name
        cardTextView.text = item.description
        
        sizeArray = item.getOffers()

        itemImages = item.getProductImages()
        images = [item]
        
        addSize()
        
        imageCollectionView.reloadData()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cardButton.layer.cornerRadius = 15
        cardButton.layer.borderWidth = 3
        cardButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        itemCart.imageUrl = item.mainImage
        itemCart.price = item.price
        itemCart.name = item.name

    }
    
    @IBAction func addToProduct(_ sender: UIButton) {
        if sizeArray.count > 1 {
            performSegue(withIdentifier: "sizeSegue", sender: item )
        }  else {
            alert()
            RealmManager.shared.saveNew(item: itemCart)
            
        }
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "sizeSegue",
           let dvc = segue.destination as? SizeTableViewController,
           let item = sender as? Items {
            dvc.item = item
            
        }
    }

}

extension ProductCardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if itemImages.count > 0 {
            return itemImages.count
        } else {
            return images.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionViewCell", for: indexPath) as! ImagesCollectionViewCell

        if itemImages.count > 0 {
            cell.initCellItems(item: itemImages[indexPath.row])
        } else {
            cell.initCellItems2(item: images[indexPath.row])
        }

        return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  view.frame.width, height: view.frame.width )

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, canEditItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func addSize() {
        for el in sizeArray {
            itemCart.size = el.size
        }
    }
    
    func alert() {
        let alert = UIAlertController(title: nil, message: "product added", preferredStyle: .alert)
        let buttom = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(buttom)
        self.present(alert, animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
        
        
    }
    
}
