//
//  MovieDetailHeaderView.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 2.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import UIKit


class MovieDetailHeaderView: UIView {

    // MARK: - Properties
    
    var posterImageView: UIImageView!
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Setup
    
    func setupComponents() {
        self.posterImageView = UIImageView()
        self.posterImageView.contentMode = .top
        self.posterImageView.clipsToBounds = true
        self.addSubview(self.posterImageView)
        
        self.posterImageView.translatesAutoresizingMaskIntoConstraints = false
        self.posterImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.posterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.posterImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.posterImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods

}
