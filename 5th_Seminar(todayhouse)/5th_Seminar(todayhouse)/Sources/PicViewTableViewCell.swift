//
//  PicViewTableViewCell.swift
//  5th_Seminar(todayhouse)
//
//  Created by 양재욱 on 2020/05/27.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class PicViewTableViewCell: UITableViewCell {
    static let identifier: String = "picVIewCell"

    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblRoomCategory: UILabel!
    @IBOutlet var btnFollow: UIButton!
    @IBOutlet var btnShare: UIButton!
    @IBOutlet var btnEtc: UIButton!
    @IBOutlet var lblText1: UILabel!
    @IBOutlet var roomImageView: UIImageView!
    @IBOutlet var btnLike: UIButton!
    @IBOutlet var btnComment: UIButton!
    @IBOutlet var btnBookMark: UIButton!
    @IBOutlet var lblText2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRoomInformation(userImageName: String, userName: String, roomCategory: String, text1: String, roomImageName: String, text2: String) {
        
        userImageView.image = UIImage(named: userImageName)
        lblUserName.text = userName
        lblRoomCategory.text = roomCategory
        lblText1.text = text1
        roomImageView.image = UIImage(named: roomImageName)
        lblText2.text = text2
    }

}
