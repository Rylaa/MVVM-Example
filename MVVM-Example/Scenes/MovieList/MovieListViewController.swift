//
//  MovieListViewController.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 9.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit

class MovieListViewController : UITableViewController {
    
    var viewModel: MovieListViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    private var movieList: [MoviePresentation] = []
    let cellID = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.load()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = movieList[indexPath.row].title
        return cell
    }
}
extension MovieListViewController : MovieListViewModelDelegate {
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
            
        case.showMovieList(let movies):
            movieList = movies
            tableView.reloadData()
            
        }
    }
    
    
}
