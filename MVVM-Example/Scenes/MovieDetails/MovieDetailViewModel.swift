//
//  MovieListDetailViewModel.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 10.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation


final class MovieDetailViewModel : MovieDetailProtocol {
    
    weak var delegate: MovieDetailDelegate?
    private var presentation : MovieDetailPresentation
    init(presentation: Results) {
        self.presentation = MovieDetailPresentation(movie: presentation)
    }
    func load() {
       delegate?.showMovie(presentation: presentation)
    }
    

}
