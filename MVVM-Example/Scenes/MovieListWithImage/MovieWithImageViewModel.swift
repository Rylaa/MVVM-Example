//
//  MovieWithImageViewModel.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 18.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation


final class MovieWithImageViewModel : MovieWithImageProtocol {
    // MARK: - Properties
    weak var delegate: MovieWithImageDelegate?
    var presentation : [movieWithImagePresentation]
    // MARK: - Init
    init(presentation : [MoviePresentation] ) {
        let map = presentation.map({ movieWithImagePresentation(movieList: $0)})
        self.presentation = map
    }
    // MARK: - Handler
    func load() {
        notify(.setLoading(true))
        notify(.pageTitle("Movie List"))
        notify(.showList(presentation))
        notify(.setLoading(false))
    }
    func notify(_ outputs: MovieWithImageOutputs){
        delegate?.handleViewModelOutput(outputs)
    }
}


