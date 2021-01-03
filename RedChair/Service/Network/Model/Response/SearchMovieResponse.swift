//
//  SearchMovieResponse.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 1.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import Foundation

struct SearchMovieResponse: Codable {
    var response: String?
    var totalResults: String?
    var search: [SearchMovieElement]?
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case search = "Search"
        case totalResults
    }
}
