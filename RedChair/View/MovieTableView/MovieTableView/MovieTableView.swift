//
//  MovieTableView.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 1.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import UIKit

protocol MovieTableViewDelegate: class {
    func movieTableView(lastCellWillDisplay page: Int)
    func movieTableView(didSelectMovie movieName: String)
}

class MovieTableView: UITableView {

    // MARK: - Properties
    
    var movieList: [SearchMovie] = [] {
        didSet {
            self.reloadData()
        }
    }
    var page = 1
    var tableViewDelegate: MovieTableViewDelegate?
    var totalResults = 0
    
    
    // MARK: - Initializers
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.register(UINib(nibName: TableViewCellHelper.movie.name, bundle: nil), forCellReuseIdentifier: TableViewCellHelper.movie.id)
        self.delegate = self
        self.dataSource = self
    }
    
    
    // MARK: - Methods
    
    func removeAllMovies() {
        self.movieList.removeAll()
        self.page = 1
    }
    
    @objc func loadTable() {
        self.page += 1
        self.tableViewDelegate?.movieTableView(lastCellWillDisplay: self.page)
    }
}

extension MovieTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellHelper.movie.id, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let movie = self.movieList[indexPath.row]
        
        cell.titleLabel.text = movie.title
        cell.yearLabel.text = movie.year
        cell.posterImageView.image = Utility.sharedInstance.getPosterImage(movie.poster)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width*0.42
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MovieTableViewCell else { return }
        
        cell.backgroundColor = ColorHelper.theme.color
        cell.labelTextColor = .white
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MovieTableViewCell else { return }
        
        cell.backgroundColor = .clear
        cell.labelTextColor = .black
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.movieList.count - 1 {
            if self.movieList.count < self.totalResults {
                self.perform(#selector(loadTable), with: nil, afterDelay: 1.0)
            }
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MovieTableViewCell else { return }
        let movieName = cell.titleLabel.text ?? ""
        self.tableViewDelegate?.movieTableView(didSelectMovie: movieName)
    }
}
