//
//  MovieDetailViewController.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 14.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit

class MovieDetailViewController : UIViewController {
    
    var viewModel : MovieDetailProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewModel?.load()
    }
    
    
}


extension MovieDetailViewController : MovieDetailDelegate {
    func showMovie(presentation movie: MovieDetailPresentation) {
        print(movie.name)
        print(movie.detail)
    }
    
    
}
