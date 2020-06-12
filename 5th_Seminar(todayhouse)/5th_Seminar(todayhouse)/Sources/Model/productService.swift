//
//  productService.swift
//  5th_Seminar(todayhouse)
//
//  Created by Soojin Lee on 2020/06/12.
//  Copyright © 2020 hjyoo. All rights reserved.
//


import Foundation
import Alamofire

struct ProductServices {
    
    static let Shared = ProductServices()
    
    func getProductData(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        Alamofire.request(APIConstants.sellURL, method: .get, parameters: .none, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            
            switch response.result {
                
            case .success:
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let object = try decoder.decode(ResponseResult.self, from: data)
                    completion(.success(object))
                    
                } catch (let err) {
                    print(err.localizedDescription)
                }
            case .failure:
                completion(.pathErr)
            }
        }
    }
    
}
