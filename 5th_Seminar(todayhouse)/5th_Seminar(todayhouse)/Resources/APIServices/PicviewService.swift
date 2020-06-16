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
    //private init(){}
    static let shared = PicviewService()
    
    let header: HTTPHeaders = ["Content-Type": "application/json"]
    var toggle = false
    
    func getData(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let dataRequest = Alamofire.request(APIConstants.postURL)

        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success :
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.result.value else {return}
                let networkResult = self.judge(by: statusCode,value)
                completion(networkResult)
            case .failure : completion(.networkFail)
            }
        }
    }
    
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isProduct(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isProduct(by data:Data) ->NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(PicviewData.self, from: data) else { return .pathErr }
        
        print("====================Roomdata====================")
        print(decodedData)
        guard let roomData = decodedData.data else { return .requestErr(decodedData.message) }

        return .success(roomData)
    }
}
