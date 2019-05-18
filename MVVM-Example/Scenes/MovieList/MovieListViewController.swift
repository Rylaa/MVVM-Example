//
//  MovieListViewController.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 9.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit

class MovieListViewController : UITableViewController {
    // Mark: - Properties
    var viewModel: MovieListViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    var filterBtn = UIBarButtonItem()
    private var movieList: [MoviePresentation] = []
    let cellID = "cell"
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.load()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        filterBtn = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(handleBarButton))
        self.navigationItem.rightBarButtonItem = filterBtn
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = movieList[indexPath.row].name
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectMovie(at: indexPath.row)
    }
    @objc func handleBarButton() {
        print("asd")
        let ac = UIAlertController(title: "Filter List", message: "Load list with images", preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "Load Images", style: .default) { (UIAlertAction) in
            // TODO Implement...
            self.viewModel?.showImageMovie()
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(alertAction)
        ac.addAction(cancelAction) 
        present(ac, animated: true, completion: nil)
    }
}

// MARK: - Handlers
extension MovieListViewController : MovieListViewModelDelegate {
    func navigate(to route: showMovie) { // gelen protocol
        switch route {
        case .detail(let viewModel):
            let controller = MovieDetailBuilder.make(showMovie: viewModel)
            controller.viewModel = viewModel
            show(controller, sender: nil)
        case .showImageDetail(let viewModel):
            let controller = MovieWithImageBuilder.make(movieList: viewModel)
            controller.viewModel = viewModel
            show(controller, sender: nil)
        }
    }
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
