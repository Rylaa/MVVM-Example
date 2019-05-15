//
//  MovieDetailViewController.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 14.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit
import TinyConstraints

class MovieDetailViewController : UIViewController {
    
    var viewModel : MovieDetailProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    var name = UILabel()
    var artistName = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel?.load()
        
        view.addSubview(name)
        view.addSubview(artistName)
        
        name.center(in: view)
        artistName.topToBottom(of: name)
        artistName.centerX(to: view)
        
    }
}


extension MovieDetailViewController : MovieDetailDelegate {
    func showMovie(presentation movie: MovieDetailPresentation) {
       self.name.text = movie.name
        self.artistName.text = movie.detail
    }
}
