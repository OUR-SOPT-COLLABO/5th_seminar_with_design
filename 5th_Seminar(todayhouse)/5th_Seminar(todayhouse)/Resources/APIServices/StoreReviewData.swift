//
//  StoreReviewData.swift
//  5th_Seminar(todayhouse)
//
//  Created by hjyoo on 2020/06/07.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import Foundation

struct StoreReviewData: Codable {
    var status: Int
    var success: Bool
    
    var reviewIndex : Int
    var userIndex : Int
    var sellIndex : Int
    var content : String
    var createdAt : String
    var imgUrl : String
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case reviewIndex  = "reviewIndex"
        case userIndex = "userIndex"
        case sellIndex = "sellIndex"
        case content = "content"
        case createdAt = "createdAt"
        case imgUrl = "imgUrl"
    }
     
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        reviewIndex  = (try? values.decode(Int.self, forKey: .reviewIndex )) ?? -1
        userIndex  = (try? values.decode(Int.self, forKey: .userIndex )) ?? -1
        sellIndex  = (try? values.decode(Int.self, forKey: .sellIndex )) ?? -1
        content  = (try? values.decode(String.self, forKey: .content )) ?? ""
        createdAt  = (try? values.decode(String.self, forKey: .createdAt )) ?? ""
        imgUrl  = (try? values.decode(String.self, forKey: .imgUrl )) ?? ""
    }
}
