//
//  StoreITemTableViewCell.swift
//  5th_Seminar(todayhouse)
//
//  Created by hjyoo on 2020/05/24.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit



class StoreITemTableViewCell: UITableViewCell {

    var productData: ResponseResult?
    var product : [ProductDatafs] = []
    
    @IBOutlet weak var storeAddressLabel: UILabel!
    @IBOutlet weak var storeCompanyLabel: UILabel!
    @IBOutlet weak var storeProductnameLabel: UILabel!
    @IBOutlet weak var storesaleLabel: UILabel!
    @IBOutlet weak var storePriceLabel: UILabel!
    @IBOutlet weak var storeSaledpriceLabel: UILabel!
    
    @IBOutlet weak var StoreItemCollectionView: UICollectionView!
    
    
    func bind(){
        ProductServices.Shared.getProductData(){
            [weak self]
            
            data in
            
            guard let `self` = self else {return}
            
            switch data {
                
            case .success(let res):
                let response = res as! ResponseResult
                self.productData = response
//                self.StoreITemTableViewCell.reloadData()
                
                
            case .requestErr:
                print(".requestErr")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                print(".networkFail")
                
            }
            

        }
  
       

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bind()
        
       
        
        storeAddressLabel.text = productData?.data.category
        storeCompanyLabel.text = productData?.data.company
        storeProductnameLabel.text = productData?.data.title
        storesaleLabel.text = productData?.data.discount
        storePriceLabel.text = productData?.data.price
//      storeSaledpriceLabel.text = String(Int(storePriceLabel.text ?? nil)??0)
        
    
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

//        self.StoreItemCollectionView.dataSource = self
//        self.StoreItemCollectionView.delegate = self
        // Configure the view for the selected state
        
        
        }
    
    
    
}
//extension StoreITemTableViewCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return productData.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = StoreItemCollectionView.dequeueReusableCell(withReuseIdentifier: "StoreItemCollectionView", for: indexPath) as? StoreItemCollectionViewCell2 else {
//            return UICollectionViewCell() }
//
//        cell.bind(model: productData[indexPath.item])
//
//        return cell
//    }
//
//
//}
//
//extension StoreITemTableViewCell: UICollectionViewDelegate {
//}
//
//
//extension StoreITemTableViewCell {
//    func setDefaultRequest() {
//
//        ProductServices.Shared.getProductData { data in
//            if let metaData = data {
//                self.productData = metaData
//                self.StoreItemCollectionView.reloadData()
//            }
//        }
//
//        ProductServices.Shared.getProductData { data in
//
//
//        }
//    }
//}

