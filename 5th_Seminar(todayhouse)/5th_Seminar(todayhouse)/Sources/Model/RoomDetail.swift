//
//  RoomDetail.swift
//  5th_Seminar(todayhouse)
//
//  Created by 양재욱 on 2020/06/09.
//  Copyright © 2020 hjyoo. All rights reserved.

import Foundation
import UIKit

struct RoomDetail{
    var imageName: String
    var factoryName: String
    var description: String
    var price: String
    
    init(imageName: String, factoryName:String, description:String, price: String) {
        self.imageName = imageName
        self.factoryName = factoryName
        self.description = description
        self.price = price
    }
}
