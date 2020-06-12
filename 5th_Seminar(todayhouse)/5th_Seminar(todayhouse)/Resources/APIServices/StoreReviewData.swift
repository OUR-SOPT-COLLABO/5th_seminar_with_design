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
    var data: [Data]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status )) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success )) ?? false
        message = (try? values.decode(String.self, forKey: .message )) ?? ""
        data = (try? values.decode([Data].self, forKey: .data )) ?? []
    }
}

struct Data: Codable {
    var sellIdx : Int
    var category : String
    var company : String
    var title : String
    var price : Int
    var discount : Int
    var imgs : [Imgs]?
    var reviews : [Reviews]?
    
    enum CodingKeys: String, CodingKey {
        case sellIdx = "sellIdx"
        case category = "category"
        case company = "company"
        case title = "title"
        case price = "price"
        case discount = "discount"
        case imgs = "imgs"
        case reviews = "reviews"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sellIdx = (try? values.decode(Int.self, forKey: .sellIdx )) ?? -1
        category = (try? values.decode(String.self, forKey: .category )) ?? ""
        company = (try? values.decode(String.self, forKey: .company )) ?? ""
        title = (try? values.decode(String.self, forKey: .title )) ?? ""
        price = (try? values.decode(Int.self, forKey: .price )) ?? -1
        discount = (try? values.decode(Int.self, forKey: .discount )) ?? -1
        imgs = (try? values.decode([Imgs].self, forKey: .imgs)) ?? []
        reviews = (try? values.decode([Reviews].self, forKey: .reviews)) ?? []
    }
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

