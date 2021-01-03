//
//  NetworkService.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 1.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import Foundation
import Reachability
import Alamofire

public class NetworkService {
    public static let sharedInstance = NetworkService()
    
    func isConnected() -> Bool {
        do {
            let reachability = try Reachability()
            
            return reachability.connection != .unavailable
        }
        catch {
            return false
        }
    }
    
    func searchMovie(_ name: String, _ page: Int, completion: @escaping (_ isSuccess: Bool, _ response: SearchMovieResponse?) -> Void) {
        let params =
            ["apikey": API_KEY,
             "s": name,
             "type": "movie",
             "page": String(page)]
        
        guard let url = URLBuilder.sharedInstance.buildUrl(params: params) else {
            return
        }
        
        AF.request(url).responseDecodable(of: SearchMovieResponse.self) { (response) in
            switch response.result {
            case .success(let searchResult):
                if let isSuccess = searchResult.response {
                    if isSuccess.elementsEqual(SUCCESS) {
                        completion(true, searchResult)
                    }
                    else {
                        completion(false, nil)
                    }
                }
                else {
                    completion(false, nil)
                }
            case .failure(_):
                completion(false, nil)
            }
        }
    }
    
    func getMovieDetail(_ name: String, completion: @escaping (_ isSuccess: Bool, _ response: MovieDetailResponse?) -> Void) {
        let params =
        ["apikey": API_KEY,
         "t": name]
        
        guard let url = URLBuilder.sharedInstance.buildUrl(params: params) else {
            return
        }
        
        AF.request(url).responseDecodable(of: MovieDetailResponse.self) { (response) in
            switch response.result {
            case .success(let result):
                if let isSuccess = result.response {
                    if isSuccess.elementsEqual(SUCCESS) {
                        completion(true, result)
                    }
                    else {
                        completion(false, nil)
                    }
                }
            case .failure(_):
                completion(false, nil)
            }
        }
    }
}
