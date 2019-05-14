//
//  MovieDetailPresentation.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 10.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation

struct MovieDetailPresentation  {
    let name : String
    let detail : String
}


extension  MovieDetailPresentation {
    init(movie: Results) {
        self.name = movie.name
        self.detail = movie.artistName
    }
}
