//
//  RoomInformation.swift
//  5th_Seminar(todayhouse)
//
//  Created by 양재욱 on 2020/05/27.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import Foundation
import UIKit

struct RoomInformation{
    var userImageName: String
    var userName: String
    var roomCategory: String
    var text1: String
    var roomImageName: String
    var text2: String
    
    init(userImageName: String, userName: String, roomCategory: String, text1: String, roomImageName: String, text2: String) {
        self.userImageName = userImageName
        self.userName = userName
        self.roomCategory = roomCategory
        self.text1 = text1
        self.roomImageName = roomImageName
        self.text2 = text2
    }
}
