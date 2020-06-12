//
//  SellService.swift
//  5th_Seminar(todayhouse)
//
//  Created by hjyoo on 2020/06/12.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import Foundation
import Alamofire

// 4단계(get)

class SellService {
    
    //다른 class에서 방해하는 것을 막아주는 구문
    private init() {}
    
    static let shared = SellService()

    //(completion: @escaping (enum으로선언한것<[Data첫번째구조체이름.두번째구조체이름], Error(swift타입)>) -> Void)
    func getSell(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = APIConstants.sellURL
        Alamofire.request(URL).responseJSON {
            response in
            
            switch response.result {
                
            case .success:
                
                //데이터가 들어왔는지 아닌지: 데이터가 안 들어왔을 때(= nil 일때) else실행
                guard let data = response.data else { return }
                
                do{
                    let decoder = JSONDecoder()
                    
                    let object = try decoder.decode(StoreReviewData.self, from: data)
                    
                    if object.success == true {
                        print("성공")
                        completion(.success(object.data as Any))
                    }
                    else {
                        completion(.requestErr(fatalError("서버이상")))
                    }

                } catch(let err) {
                    print(err.localizedDescription)
                    completion(.pathErr)
                }
            
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
                break
            }
        }
    }
}

