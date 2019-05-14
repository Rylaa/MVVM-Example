//
//  MovieDetailBuilder.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 14.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation


final class MovieDetailBuilder {
    static func make(showMovie : MovieDetailProtocol) -> MovieDetailViewController {
        let controller = MovieDetailViewController()
        controller.viewModel = showMovie
        return controller
    }
}
