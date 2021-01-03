//
//  Utils.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 2.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import UIKit

public class Utility {
    static let sharedInstance = Utility()
    
    func getPosterImage(_ urlString: String) -> UIImage? {
        if !self.isUrlNA(urlString) {
            do {
                if let url = URL(string: urlString) {
                    let data = try Data(contentsOf: url)
                    if let image = UIImage(data: data) {
                        return image
                    }
                }
            }
            catch {
                print(error.localizedDescription)
                return ImageHelper.noImageIcon.image
            }
        }
        
        return ImageHelper.noImageIcon.image
    }
    
    func isUrlNA(_ url: String) -> Bool {
        return url.elementsEqual("N/A")
    }
}
