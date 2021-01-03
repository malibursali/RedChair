//
//  URLBuilder.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 1.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import Foundation

public class URLBuilder {
    static let sharedInstance = URLBuilder()
    
    func buildUrl(params: [String: String]) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = BASE_URL
        urlComponents.path = "/"
        urlComponents.queryItems = self.buildQueryItems(params)
        
        return urlComponents.url
    }
    
    func buildQueryItems(_ params: [String: String]) -> [URLQueryItem] {
        return params.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
