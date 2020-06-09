//
//  RoomDetailCell.swift
//  5th_Seminar(todayhouse)
//
//  Created by 양재욱 on 2020/06/09.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class RoomDetailCell: UICollectionViewCell {
    static let identifier:String = "RoomDetailCell"
    
    @IBOutlet weak var roomDetailImage: UIImageView!
    @IBOutlet weak var roomDetailFName: UILabel!
    @IBOutlet weak var roomDetailDesc: UILabel!
    @IBOutlet weak var roomDetailPrice: UILabel!
    
    func set(roomDetail: RoomDetail){
        roomDetailImage.image = UIImage(named: roomDetail.imageName)
        roomDetailFName.text = roomDetail.factoryName
        roomDetailDesc.text = roomDetail.description
        roomDetailPrice.text = roomDetail.price
        
    }
}
