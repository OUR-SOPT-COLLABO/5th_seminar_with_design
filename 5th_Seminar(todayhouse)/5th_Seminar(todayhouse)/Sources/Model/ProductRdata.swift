//
//  ProductRdata.swift
//  5th_Seminar(todayhouse)
//
//  Created by Soojin Lee on 2020/06/12.
//  Copyright © 2020 hjyoo. All rights reserved.
//


import Foundation

struct ResponseResult: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: ProductDatafs
}

struct ProductDatafs: Codable {
    let category, company, title, price: String
    let discount: String
    let imgs: [Img]
    let reviews: [Review]
}

struct Img: Codable {
    let imgURL: String

    enum CodingKeys: String, CodingKey {
        case imgURL = "imgUrl"
    }
}

struct Review: Codable {
    let imgURL, profileImgURL: String
    let name: String
    let createdAt: String?
    let content: String
    let price: String?

    enum CodingKeys: String, CodingKey {
        case imgURL = "imgUrl"
        case profileImgURL = "profileImgUrl"
        case name, createdAt, content, price
    }
}
