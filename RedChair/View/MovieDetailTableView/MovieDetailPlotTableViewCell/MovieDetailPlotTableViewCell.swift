//
//  MovieDetailPlotTableViewCell.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 2.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import UIKit

class MovieDetailPlotTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet weak var plotTextView: UITextView!
    
    
    // MARK: - Initializers
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
