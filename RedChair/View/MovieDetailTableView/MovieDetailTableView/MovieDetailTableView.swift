//
//  MovieDetailTableView.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 2.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import UIKit

class MovieDetailTableView: UITableView {

    // MARK: - Properties
    
    var movieDetail: MovieDetail? {
        didSet {
            self.reloadData()
            if let movieDetail = self.movieDetail {
                FirebaseService.sharedInstance.analyticsLogEvent(movieDetail)
            }
        }
    }
    
    
    // MARK: - Initilazers
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.delegate = self
        self.dataSource = self
        self.register(UINib(nibName: TableViewCellHelper.movieDetail.name, bundle: nil), forCellReuseIdentifier: TableViewCellHelper.movieDetail.id)
        self.register(UINib(nibName: TableViewCellHelper.movieDetailPlot.name, bundle: nil), forCellReuseIdentifier: TableViewCellHelper.movieDetailPlot.id)
    }
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    
}

extension MovieDetailTableView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height*0.4)
        let headerView = MovieDetailHeaderView(frame: frame)
        
        if let posterUrl = self.movieDetail?.poster {
            headerView.posterImageView.image = Utility.sharedInstance.getPosterImage(posterUrl)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.height*0.4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieDetail != nil ? 2 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellHelper.movieDetail.id, for: indexPath) as? MovieDetailDescriptionTableViewCell else {
                return UITableViewCell()
            }
            
            if let movieDetail = self.movieDetail {
                cell.titleLabel.text = movieDetail.title
                cell.infoLabel.text = "\(movieDetail.year)\n\(movieDetail.runtime)\n\(movieDetail.genre)\n\(movieDetail.country)\n\(movieDetail.language)"
                cell.directorLabel.text = movieDetail.director
            }
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellHelper.movieDetailPlot.id, for: indexPath) as? MovieDetailPlotTableViewCell else {
                return UITableViewCell()
            }
            
            if let movieDetail = self.movieDetail {
                cell.plotTextView.text = movieDetail.plot
            }
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height*0.3
    }
}
