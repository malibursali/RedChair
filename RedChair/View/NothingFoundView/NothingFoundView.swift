//
//  NothingFoundView.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 2.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import UIKit

class NothingFoundView: UIView {
    
    // MARK: - Properties
    
    var icon: UIImageView!
    var textLabel: UILabel!
    
    
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
        self.backgroundColor = .white
        
        self.icon = UIImageView(image: ImageHelper.sadFace.image)
        self.icon.alpha = 0.6
        self.addSubview(self.icon)
        
        self.textLabel = UILabel()
        self.textLabel.font = UIFont(name: "Avenir-Heavy", size: 20)
        self.textLabel.text = "No movie found..."
        self.textLabel.alpha = 0.6
        self.addSubview(self.textLabel)
        
        self.icon.translatesAutoresizingMaskIntoConstraints = false
        self.icon.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.icon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.textLabel.topAnchor.constraint(equalTo: self.icon.bottomAnchor, constant: 10).isActive = true
    }
}
