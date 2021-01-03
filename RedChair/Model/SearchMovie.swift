//
//  SearchMovie.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 2.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import Foundation

class SearchMovie {
    
    // MARK: - Properties
    
    var poster: String
    var title: String
    var year: String
    
    
    // MARK: - Initializers
    
    init(_ poster: String?, _ title: String?, _ year: String?) {
        self.poster = poster ?? ""
        self.title = title ?? ""
        self.year = year ?? ""
    }
}
