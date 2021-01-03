//
//  MovieDetailViewController.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 2.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import UIKit

class MovieDetailViewController: BaseViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: MovieDetailTableView!
    var movieName: String?
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movieName = self.movieName {
            self.getMovieDetail(movieName)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    // MARK: - Setup
    
    override func setupComponents() {
        super.setupComponents()
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        self.setTitle("Movie Detail")
    }
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func getMovieDetail(_ name: String) {
        self.showLoadingView()
        
        NetworkService.sharedInstance.getMovieDetail(name) { (isSuccess, response) in
            self.hideLoadingView()
            
            if isSuccess {
                self.tableView.movieDetail = response.map{ MovieDetail($0.title, $0.year, $0.released, $0.runtime, $0.genre, $0.director, $0.actors, $0.plot, $0.language, $0.country, $0.poster, $0.metascore, $0.imdbRating, $0.website, ratings: $0.ratings)}
            }
            else {
                self.showAlert(title: "Ooops...", message: "Something went wrong. Please try later.")
            }
        }
    }
}
