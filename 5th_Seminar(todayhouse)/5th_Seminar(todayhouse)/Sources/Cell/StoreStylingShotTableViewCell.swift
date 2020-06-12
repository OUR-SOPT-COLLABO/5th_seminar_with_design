//
//  StoreStylingShotTableViewCell.swift
//  5th_Seminar(todayhouse)
//
//  Created by hjyoo on 2020/05/24.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit
import Kingfisher

class StoreStylingShotTableViewCell: UITableViewCell {
    
    @IBOutlet weak var StylingshotCV: UICollectionView!
    @IBOutlet weak var stylingbigImg: UIImageView!
    
    //Cell에 들어갈 데이터저장배열
        //var stylingdataset : [Data] = []
        //var stylingdataset : StoreReviewData!
        var stylingdataList : [StoreReviewData.Data] = []
        var stylingimgList : [StoreReviewData.Data.Imgs] = []
        var stylingreviewList : [StoreReviewData.Data.Reviews] = []
        
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
            
            // Register the xib for collection view cell
            let cellNib = UINib(nibName: "StylingshotCell", bundle: nil)
            self.StylingshotCV.register(cellNib, forCellWithReuseIdentifier: "stylingshotCell")
            
            //통신 부분
            SellService.shared.getSell(){
                responsedata in
                switch responsedata {
                case .success(let data):
                    /*
                    self.stylingdataset = (data as? [Data])!
                    print(self.stylingdataset)
                    */
                    if let StylingdataList = data as? [StoreReviewData.Data]{
                        self.stylingdataList = StylingdataList
                        print(self.stylingdataList)
                        print(self.stylingimgList)
                        print(self.stylingreviewList)
                    }
                    else if let StylingimgList = data as? [StoreReviewData.Data.Imgs]{
                        self.stylingimgList = StylingimgList
                        //print(self.stylingimgList)
                    }
                    else if let StylingreviewList = data as? [StoreReviewData.Data.Reviews]{
                        self.stylingreviewList = StylingreviewList
                        //print(self.stylingreviewList)
                    }
                    self.StylingshotCV.dataSource = self
                    
                    print("success")
                case .requestErr(_):
                    print("request error")
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail :
                    print("failure")
                }
            }
            
            // Comment if you set Datasource and delegate in .xib
            //self.StylingshotCV.dataSource = self
            self.StylingshotCV.delegate = self
            
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
        
    }

    extension StoreStylingShotTableViewCell: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            print(stylingdataList.count)
            print(stylingimgList.count)
            print(stylingreviewList.count)
            return stylingimgList.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if let cell = StylingshotCV.dequeueReusableCell(withReuseIdentifier: "stylingshotCell", for: indexPath) as? StylingshotCell {
                
                let reviewsImg = stylingimgList[indexPath.row]
                
                cell.stylingpriviewImg.imageFromUrl(reviewsImg.imgUrl, defaultImgPath: "http:// ~~ ")
                //cell.stylingpriviewImg.image = UIImage(named: stylingpriviewList[indexPath.row].stylingpriviewImg)
                return cell
                
            }
            return UICollectionViewCell()
        }
        
    }

    extension StoreStylingShotTableViewCell: UICollectionViewDelegate {
    }

    //Kingfisher로 이미지 url 받아오는 구문
    extension UIImageView {
        public func imageFromUrl(_ urlString: String?, defaultImgPath : String) {
            let defaultImg = UIImage(named: defaultImgPath)
            if let url = urlString {
                if url.isEmpty {
                    self.image = defaultImg
                } else {
                    self.kf.setImage(with: URL(string: url), placeholder: defaultImg, options: [.transition(ImageTransition.fade(0.5))])
                }
            } else {
                self.image = defaultImg
            }
        }
    }
