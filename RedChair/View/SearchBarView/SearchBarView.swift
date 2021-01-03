//
//  SearchBarView.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 1.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import UIKit

protocol SearchBarViewDelegate: class {
    func searchBarView(searchButtonDidTapped string: String)
}

class SearchBarView: UIView {
    
    // MARK: - Properties
    
    var textField: UITextField!
    var searchIcon: UIImageView!
    var delegate: SearchBarViewDelegate?
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setupComponents()
    }
    
    
    //MARK: - Setup
    
    private func setupComponents() {
        self.textField = UITextField()
        self.searchIcon = UIImageView(image: ImageHelper.searchIcon.image)
        self.addSubview(self.textField)
        self.addSubview(self.searchIcon)
        
        self.searchIcon.translatesAutoresizingMaskIntoConstraints = false
        self.searchIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        self.searchIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        self.searchIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        self.searchIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        self.textField.leadingAnchor.constraint(equalTo: self.searchIcon.trailingAnchor, constant: 5).isActive = true
        self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        self.textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        self.textField.backgroundColor = .clear
        self.textField.placeholder = "Search..."
        self.textField.borderStyle = .roundedRect
        self.textField.returnKeyType = .search
        self.textField.delegate = self
    }
    
    //MARK: - Actions
    
    
    //MARK: - Methods
    
    
}

extension SearchBarView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.delegate?.searchBarView(searchButtonDidTapped: textField.text ?? "")
        
        return true
    }
}
