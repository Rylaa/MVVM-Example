//
//  MovieListWithImage.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 18.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit

class MovieWithImageViewController : UITableViewController {
    
    // MARK: - Properties
    var viewModel : MovieWithImageProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    var movieList : [movieWithImagePresentation] = []
    let cellID = "cell"
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
        tableView.register(MovieWithImageTableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MovieWithImageTableViewCell
        cell.albumImage.kf.setImage(with: movieList[indexPath.row].image)
        cell.name.text = movieList[indexPath.row].name
        cell.artistName.text = movieList[indexPath.row].detail
        
        return cell
    }
    
}

extension MovieWithImageViewController : MovieWithImageDelegate {
    func handleViewModelOutput(_ outPuts: MovieWithImageOutputs) {
        switch outPuts {
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .showList(let Movielist):
            self.movieList = Movielist
        case .pageTitle(let pageTitle):
            self.title = pageTitle
        }
    }
    
    
}
