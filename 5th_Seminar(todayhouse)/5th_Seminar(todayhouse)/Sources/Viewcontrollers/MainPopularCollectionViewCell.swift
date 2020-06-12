//
//  MainPopularCollectionViewCell.swift
//  5th_Seminar(todayhouse)
//
//  Created by 김지현 on 2020/06/11.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

struct PopularData {
    var popularImage: UIImage?
    //var imageNum: String
    init(imageName: String) {
        self.popularImage = UIImage(named: imageName)
    }
}

class MainPopularCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "PopularCell"
    
    @IBOutlet weak var popularImageView: UIButton!
    
    func popularSet(_ popularInformation: PopularData) {
        popularImageView.setImage(popularInformation.popularImage, for: .normal)
        //ImageNumLabel.text = popularInformation.imageNum
    }
}

