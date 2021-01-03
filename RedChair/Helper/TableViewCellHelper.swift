//
//  TableViewCellHelper.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 2.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import Foundation

enum TableViewCellHelper: Int {
    case movie
    case movieDetail
    case movieDetailPlot
    
    var name: String {
        switch self {
        case .movie:
            return "MovieTableViewCell"
        case .movieDetail:
            return "MovieDetailDescriptionTableViewCell"
        case .movieDetailPlot:
            return "MovieDetailPlotTableViewCell"
        }
    }
    
    var id: String {
        return "\(self.name)ID"
    }
}
