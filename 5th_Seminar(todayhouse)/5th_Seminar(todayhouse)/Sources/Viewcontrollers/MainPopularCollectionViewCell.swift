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
    
    @IBOutlet weak var popularImageView: UIImageView!
    
    func popularSet(_ popularInformation: PopularData) {
        popularImageView.image = popularInformation.popularImage
        //ImageNumLabel.text = popularInformation.imageNum
    }
}

