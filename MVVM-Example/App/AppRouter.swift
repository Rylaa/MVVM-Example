//
//  AppRouter.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 9.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit

final class AppRouter  {
    let window : UIWindow
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    func start() {
        let viewController = MovieListBuilder.make()
        viewController.viewModel =  MovieListViewModel(service: app.service)
        let rootController = UINavigationController(rootViewController: viewController)
        window.rootViewController = rootController
        window.makeKeyAndVisible()
    }
}
