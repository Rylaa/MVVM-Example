//
//  MovieListDetailContracts.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 10.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation

protocol MovieDetailProtocol {
    var delegate : MovieDetailDelegate? { get set }
    func load()
}

protocol MovieDetailDelegate : class {
    func showMovie(presentation : MovieDetailPresentation)
}
