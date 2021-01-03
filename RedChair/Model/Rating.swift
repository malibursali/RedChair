//
//  Rating.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 2.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import Foundation

class Rating {
    
    // MARK: - Properties
    
    var source: String
    var value: String
    
    
    // MARK: - Initilazers
    
    init(_ source: String?, _ value: String?) {
        self.source = source ?? ""
        self.value = value ?? ""
    }
}
