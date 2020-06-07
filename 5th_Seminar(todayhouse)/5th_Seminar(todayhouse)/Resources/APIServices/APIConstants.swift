//
//  APIConstants.swift
//  5th_Seminar(todayhouse)
//
//  Created by hjyoo on 2020/05/30.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://52.78.27.117:3000"
    static let bannerURL = APIConstants.baseURL + "/banner"
    static let postURL = APIConstants.baseURL + "/post"
    static let poststoryURL = APIConstants.baseURL + "/post/story"
    static let postpopularURL = APIConstants.baseURL + "/post/popular"
    static let sellURL = APIConstants.baseURL + "/sell"
    static let sellidURL = APIConstants.baseURL + "/sell/:id"
    static let sellmainURL = APIConstants.baseURL + "/sell/main"
}
