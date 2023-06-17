//
//  NetworkManager.swift
//  AutoCalculator
//
//  Created by 강성찬 on 2023-06-16.
//

import SwiftUI
import Alamofire


final class NetworkManager {
    
    func apiRequest(url: String, completion: @escaping (Currency) -> ()) {
        
        Session.default.request(url).responseDecodable(of: Currency.self) { response in
            switch response.result {
            case .success(let currencies):
                print(currencies)
                completion(currencies)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
