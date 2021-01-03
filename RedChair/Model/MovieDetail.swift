//
//  MovieDetail.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 2.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import Foundation

class MovieDetail {
    
    // MARK: - Properties
    
    var title: String
    var year: String
    var released: String
    var runtime: String
    var genre: String
    var director: String
    var actors: String
    var plot: String
    var language: String
    var country: String
    var poster: String
    var metascore: String
    var imdbRating: String
    var website: String
    var ratings: [Rating]
    
    
    // MARK: - Initializers
    
    init(_ title: String?, _ year: String?, _ released: String?, _ runtime: String?, _ genre: String?, _ director: String?, _ actors: String?, _ plot: String?, _ language: String?, _ country: String?, _ poster: String?, _ metascore: String?, _ imdbRating: String?, _ website: String?, ratings: [RatingResponse]?) {
        self.title = title ?? ""
        self.year = year ?? ""
        self.released = released ?? ""
        self.runtime = runtime ?? ""
        self.genre = genre ?? ""
        self.director = director ?? ""
        self.actors = actors ?? ""
        self.plot = plot ?? ""
        self.language = language ?? ""
        self.country = country ?? ""
        self.poster = poster ?? ""
        self.metascore = metascore ?? ""
        self.imdbRating = imdbRating ?? ""
        self.website = website ?? ""
        if let ratings = ratings {
            self.ratings = ratings.map{ Rating($0.source, $0.value) }
        }
        else {
            self.ratings = []
        }
    }
}
