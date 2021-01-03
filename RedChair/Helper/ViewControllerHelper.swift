//
//  ViewControllerHelper.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 1.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import UIKit

enum ViewControllerHelper: Int {
    case splash
    case home
    case movieDetail
    
    var name: String {
        switch self {
        case .splash:
            return "SplashViewController"
        case .home:
            return "HomeViewController"
        case .movieDetail:
            return "MovieDetailViewController"
        }
    }
}

