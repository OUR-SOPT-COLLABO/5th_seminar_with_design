//
//  StylingshotCell.swift
//  5th_Seminar(todayhouse)
//
//  Created by hjyoo on 2020/05/29.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class StylingshotCell: UICollectionViewCell {

    @IBOutlet weak var stylingpriviewImg: UIImageView!
    @IBOutlet weak var selectedImgBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func selectedPriview(_ sender: UIButton) {
        selectedImgBtn.isSelected = !selectedImgBtn.isSelected
        selectedImgBtn.imageView?.contentMode = .scaleAspectFill
        
    }
}
