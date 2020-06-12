//
//  StoreReviewTableViewSecondCell.swift
//  5th_Seminar(todayhouse)
//
//  Created by 최영재 on 2020/05/26.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class StoreReviewTableViewSecondCell: UITableViewCell {

 
    @IBOutlet weak var SRTVCuserName: UILabel!
    @IBOutlet weak var SRTVCreviewImg: UIImageView!
    @IBOutlet weak var SRTVCreviewContents: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

func reviewData(userame: String, reviewImage:String, reviewContents:String){
    SRTVCuserName.text = userName
    SRTVCreviewImg.image = UIImage(named:reviewImage)
    SRTVCreviewContents.text = reviewContents
}
