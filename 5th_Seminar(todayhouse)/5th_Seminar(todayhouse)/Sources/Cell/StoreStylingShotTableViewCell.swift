//
//  StoreStylingShotTableViewCell.swift
//  5th_Seminar(todayhouse)
//
//  Created by hjyoo on 2020/05/24.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class StoreStylingShotTableViewCell: UITableViewCell {
    
    @IBOutlet weak var StylingshotCV: UICollectionView!
    @IBOutlet weak var stylingbigImg: UIImageView!
    
    var stylingpriviewList: [Stylingpriviews] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 77, height: 77)
        flowLayout.minimumLineSpacing = 15.0
        flowLayout.minimumInteritemSpacing = 8.0
        flowLayout.sectionInset.left = 15.0
        
        
        self.StylingshotCV.collectionViewLayout = flowLayout
        self.StylingshotCV.showsHorizontalScrollIndicator = false
        
        // Comment if you set Datasource and delegate in .xib
        self.StylingshotCV.dataSource = self
        self.StylingshotCV.delegate = self
        
        // Register the xib for collection view cell
        let cellNib = UINib(nibName: "StylingshotCell", bundle: nil)
        self.StylingshotCV.register(cellNib, forCellWithReuseIdentifier: "stylingshotCell")
        
        setStylingPriview()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setStylingPriview() {
        
        let styling1 = Stylingpriviews(stylingpriviewImg: "storeStylingPreview2")
        let styling2 = Stylingpriviews(stylingpriviewImg: "storeStylingPreview3")
        let styling3 = Stylingpriviews(stylingpriviewImg: "storeStylingPreview4")
        let styling4 = Stylingpriviews(stylingpriviewImg: "storeStylingPreview5")
        let styling5 = Stylingpriviews(stylingpriviewImg: "storeStylingPreview2")
        let styling6 = Stylingpriviews(stylingpriviewImg: "storeStylingPreview3")
        let styling7 = Stylingpriviews(stylingpriviewImg: "storeStylingPreview4")
        let styling8 = Stylingpriviews(stylingpriviewImg: "storeStylingPreview5")
       
        stylingpriviewList = [styling1, styling2, styling3, styling4, styling5, styling6, styling7, styling8]
    }
    
    
}

extension StoreStylingShotTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stylingpriviewList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = StylingshotCV.dequeueReusableCell(withReuseIdentifier: "stylingshotCell", for: indexPath) as? StylingshotCell {
            
            cell.stylingpriviewImg.image = UIImage(named: stylingpriviewList[indexPath.row].stylingpriviewImg)
            return cell
            
            
            
        }
        return UICollectionViewCell()
    }
    
}

extension StoreStylingShotTableViewCell: UICollectionViewDelegate {
}


