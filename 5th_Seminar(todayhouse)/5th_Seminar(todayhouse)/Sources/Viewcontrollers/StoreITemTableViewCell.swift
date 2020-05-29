//
//  StoreITemTableViewCell.swift
//  5th_Seminar(todayhouse)
//
//  Created by hjyoo on 2020/05/24.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class StoreITemTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.collectionView.dataSource = self
//        self.collectionView.delegate = self
//        self.collectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewID")
        
        let StoreImg = [
        "storeItemImg.png",
        "storeItemImg.png",
        "storeItemImg.png",
        "storeItemImg.png"]
        
    }
       
        
  


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewID", for: indexPath as IndexPath) as! StoreItemCollectionCell
        
        
        return cell
    }
}

