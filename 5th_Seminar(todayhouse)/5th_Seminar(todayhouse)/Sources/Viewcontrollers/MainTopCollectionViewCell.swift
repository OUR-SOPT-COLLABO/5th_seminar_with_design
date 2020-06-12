//
//  MainTopCollectionViewCell.swift
//  5th_Seminar(todayhouse)
//
//  Created by 김지현 on 2020/06/12.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

struct TopData {
    var topImage: UIImage?
    var imageNum: String
    init(num: String, imageName: String) {
        self.topImage = UIImage(named: imageName)
        self.imageNum = num
    }
}

class MainTopCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "TopCell"
    
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var ImageNumLabel: UILabel!
    
    func topSet(_ topInformation: TopData) {
        topImageView.image = topInformation.topImage
        ImageNumLabel.text = topInformation.imageNum
    }
}
