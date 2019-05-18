//
//  MovieWithImagePresentation-API.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 18.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation

extension movieWithImagePresentation {
    init(movieList: MoviePresentation) {
        self.name   = movieList.name
        self.detail = movieList.detail
        self.image  = movieList.image
    }
}

