//
//  ViewController.swift
//  CollectionView 2
//
//  Created by Rakshil Dudhat on 19/01/23.
//

import UIKit

struct Items {
    var name: String
    var price: Double
    var gm: String
}

class ViewController: UIViewController {

    @IBOutlet weak var itemsCollectionView: UICollectionView!
    var arrFoodItems: [Items] = []
    var arrFoodImage: [String] = ["1","2","3","4","5","6"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    private func setUp() {
        loadFoodItemsData()
            configureData()
    }

    private func loadFoodItemsData() {
        let items1: Items = Items(name: "Callfonla Pistachio", price: 110.00, gm: "100 gm")
        let items2: Items = Items(name: "Farmaley Saver Cashews", price: 90.00, gm: "100 gm")
        let items3: Items = Items(name: "Gourmla Club Mix", price: 120.00, gm: "100 gm")
        let items4: Items = Items(name: "Happilo Almods", price: 100.00, gm: "100 gm")
        let items5: Items = Items(name: "Happilo Green", price: 110.00, gm: "100 gm")
        let items6: Items = Items(name: "Happilo Healthy", price: 110.00, gm: "100 gm")
        
        arrFoodItems = [items1, items2, items3, items4, items5, items6]
    }
    
    private func configureData() {
        let nibFile: UINib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        itemsCollectionView.register(nibFile, forCellWithReuseIdentifier: "ItemCollectionViewCell")
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrFoodItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ItemCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        cell.plusButton.tag = indexPath.row
        cell.plusButton.addTarget(self, action: #selector(plusButton(_:)), for: .touchUpInside)
        let foodItems = arrFoodItems[indexPath.row]
        cell.itemLabel.text = "\(foodItems.name)"
        cell.priceLabel.text = "$\(foodItems.price)"
        cell.gmLabel.text = "\(foodItems.gm)"
        cell.itemImage.image = UIImage(named: arrFoodImage[indexPath.row])
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
    }
    @objc
    func plusButton(_ sender: UIButton) {
        print("Plus Button Tapped")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 177, height: 216)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}
