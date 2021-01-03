//
//  MovieTableViewCell.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 1.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    var labelTextColor: UIColor? = .black {
        willSet {
            self.titleLabel.textColor = newValue
            self.yearLabel.textColor = newValue
        }
    }
    
    
    // MARK: - Initializers
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    // MARK: - Methods
    
    
}
