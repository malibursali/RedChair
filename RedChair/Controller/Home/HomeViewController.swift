//
//  HomeViewController.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 1.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: MovieTableView!
    @IBOutlet weak var searchBarView: SearchBarView!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBarView.textField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    // MARK: - Setup
    
    override func setupComponents() {
        super.setupComponents()
        
        self.searchBarView.delegate = self
        self.tableView.tableViewDelegate = self
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        self.hideBackButton()
        self.showNavigationBar()
        self.setTitle("Red Chair")
    }
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func getMovies(withName name: String, _ page: Int) {
        self.hideNothingFoundView()
        self.showLoadingView()
        
        NetworkService.sharedInstance.searchMovie(name, page) { (isSuccess, response) in
            self.hideLoadingView()
            
            if isSuccess {
                if let searchResult = response?.search {
                    let movies = searchResult.map { SearchMovie($0.poster, $0.title, $0.year) }
                    
                    self.tableView.movieList.append(contentsOf: movies)
                    
                    if let totalResults = response?.totalResults {
                        self.tableView.totalResults = Int(totalResults) ?? 0
                    }
                }
            }
            else {
                self.showNothingFoundView()
            }
        }
    }
    
    func showNothingFoundView() {
        let nothingFoundView = NothingFoundView(frame: self.tableView.frame)
        nothingFoundView.tag = 200
        self.view.addSubview(nothingFoundView)
    }
    
    func hideNothingFoundView() {
        guard let nothingFoundView = self.view.viewWithTag(200) else { return }
        nothingFoundView.removeFromSuperview()
    }
}

extension HomeViewController: SearchBarViewDelegate {
    func searchBarView(searchButtonDidTapped string: String) {
        self.tableView.removeAllMovies()
        self.getMovies(withName: string, self.tableView.page)
    }
}

extension HomeViewController: MovieTableViewDelegate {
    func movieTableView(lastCellWillDisplay page: Int) {
        self.getMovies(withName: self.searchBarView.textField.text ?? "", page)
    }
    
    func movieTableView(didSelectMovie movieName: String) {
        guard let movieDetailViewController = self.getViewController(storyboard: ViewControllerHelper.movieDetail.name) as? MovieDetailViewController else { return }
        movieDetailViewController.movieName = movieName
        
        self.navigationController?.show(movieDetailViewController, sender: nil)
    }
}
