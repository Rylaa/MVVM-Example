//
//  builder.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 10.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit

final class MovieListBuilder {
    
    static func make() -> MovieListViewController {
        let viewController = MovieListViewController()
        viewController.viewModel = MovieListViewModel(service: app.service)
        return viewController
    }
}
