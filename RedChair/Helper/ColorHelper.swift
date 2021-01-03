//
//  ColorHelper.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 2.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import UIKit

enum ColorHelper: Int {
    case theme
    
    var color: UIColor? {
        switch self {
        case .theme:
            return UIColor(named: "ThemeColor")
        }
    }
}

