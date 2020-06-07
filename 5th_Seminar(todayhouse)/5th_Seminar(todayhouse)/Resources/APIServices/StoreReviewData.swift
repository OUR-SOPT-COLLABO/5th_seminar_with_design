//
//  StoreReviewData.swift
//  5th_Seminar(todayhouse)
//
//  Created by hjyoo on 2020/06/07.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import Foundation
// ~/sell/:id 와 ~/sell 에 해당
struct StoreReviewData: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: Data?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
     
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message )) ?? ""
        data = (try? values.decode(Data.self, forKey: .data )) ?? nil
    }
}

struct Data: Codable {
    var category : String
    var company : String
    var title : String
    var price : String
    var discount : String
    var imgs : [Imgs]?
    var reviews : [Reviews]?
    
}

struct Imgs: Codable {
    var imgUrl : String
}

struct Reviews: Codable {
    var imgUrl : String
    var profileImgUrl : String
    var name : String
    var createdAt : String
    var content : String
}


