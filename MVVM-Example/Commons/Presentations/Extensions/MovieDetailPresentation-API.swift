//
//  MovieDetailPresentation-API.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 15.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//


extension  MovieDetailPresentation {
    init(movie: Results) {
        self.name       = movie.name
        self.detail     = movie.artistName
        self.image      = movie.image
    }
}
