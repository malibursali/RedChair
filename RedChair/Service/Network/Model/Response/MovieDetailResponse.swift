//
//  MovieDetailResponse.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 2.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import Foundation

struct MovieDetailResponse: Codable {
    var response: String?
    var title: String?
    var year: String?
    var released: String?
    var runtime: String?
    var genre: String?
    var director: String?
    var writer: String?
    var actors: String?
    var plot: String?
    var language: String?
    var country: String?
    var awards: String?
    var poster: String?
    var metascore: String?
    var imdbRating: String?
    var production: String?
    var website: String?
    var ratings: [RatingResponse]?
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case title = "Title"
        case year = "Year"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbRating
        case production = "Production"
        case website = "Website"
        case ratings = "Ratings"
    }
}
