//
//  MovieWithImageBuilder.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 18.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation

final class MovieWithImageBuilder {
    static func make(movieList : MovieWithImageProtocol) -> MovieWithImageViewController {
        let controller = MovieWithImageViewController()
        controller.viewModel = movieList
        return controller
    }
}
