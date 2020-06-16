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
        let url = URL(string: roomDetail.imageUrl)
        let data = try? Data(contentsOf: url!)
        
        roomDetailImage.image = UIImage(data: data!)
        roomDetailFName.text = roomDetail.factoryName
        roomDetailDesc.text = roomDetail.description
        roomDetailPrice.text = String(roomDetail.price)+" 원"
        
    }
}
