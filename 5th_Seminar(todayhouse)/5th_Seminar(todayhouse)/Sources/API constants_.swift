//
//  API constants_.swift
//  5th_Seminar(todayhouse)
//
//  Created by Soojin Lee on 2020/06/12.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import Foundation


struct APIConstants {
    
    static let baseURL = "http://52.78.27.117:3001"
    static let storeitemURL = APIConstants.baseURL + "/sell/signin"
    static let storeitemdetailURL = APIConstants.baseURL + "/sell/:id"
}
