//
//  SearchMovieElement.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 1.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import Foundation

struct SearchMovieElement: Codable {
    var poster: String?
    var title: String?
    var type: String?
    var year: String?
    var imdbID: String?
    
    enum CodingKeys: String, CodingKey {
        case poster = "Poster"
        case title = "Title"
        case type = "Type"
        case year = "Year"
        case imdbID
    }
}
