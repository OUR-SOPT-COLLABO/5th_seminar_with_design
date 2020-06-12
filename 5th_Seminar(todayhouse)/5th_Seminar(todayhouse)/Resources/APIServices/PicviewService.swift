//
//  PicviewService.swift
//  5th_Seminar(todayhouse)
//
//  Created by 양재욱 on 2020/06/09.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct PicviewService {
    private init(){}
    static let shared = PicviewService()
    
    let header: HTTPHeaders = ["Content-Type": "application/json"]
    
    func getData(completion: @escaping (_ b: Bool) -> Void) {
        
        Alamofire.request(APIConstants.postURL).responseJSON{ response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print(json)
                let result = json["status"].intValue
                if result == 404{
                    completion(true)
                }
                else{
                    completion(false)
                }
            default:
                return
            }
        }
    }
}
