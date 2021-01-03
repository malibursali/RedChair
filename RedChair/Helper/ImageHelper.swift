//
//  ImageHelper.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 1.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import UIKit

enum ImageHelper: Int {
    case icon
    case searchIcon
    case noImageIcon
    case sadFace
    
    var imageName: String {
        switch self {
        case .icon:
            return "Icon"
        case .searchIcon:
            return "SearchIcon"
        case .noImageIcon:
            return  "NoImageIcon"
        case .sadFace:
            return "SadFace"
        }
    }
    
    var image: UIImage? {
        return UIImage(named: self.imageName)
    }
}
