//
//  PicviewService.swift
//  5th_Seminar(todayhouse)
//
//  Created by 양재욱 on 2020/06/09.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import Foundation
import Alamofire

struct PicviewService {
    static let shared = PicviewService()
    
    let header: HTTPHeaders = [
        "Content-Type" : "application/json"
    ]
    
}
