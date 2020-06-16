//
//  RoomDetail.swift
//  5th_Seminar(todayhouse)
//
//  Created by 양재욱 on 2020/06/09.
//  Copyright © 2020 hjyoo. All rights reserved.

import Foundation
import UIKit

struct RoomDetail{
    var imageUrl: String
    var factoryName: String
    var description: String
    var price: Int
    
    init(imageUrl: String, factoryName:String, description:String, price: Int) {
        self.imageUrl = imageUrl
        self.factoryName = factoryName
        self.description = description
        self.price = price
    }
}
