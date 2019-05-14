//
//  MovieListViewModel.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 9.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
//******************************************************************2222222222******************************************************

final class MovieListViewModel : MovieListViewModelProtocol {
    
    
    
    weak var delegate: MovieListViewModelDelegate?
    var movieList : [Results] = []
    let service : topMovieService!
    init(service: topMovieService) {
        self.service = service
    }
    
    func load( ) { // Load içerisinde  Servis çağırmamız gerekiyor
        notify(.updateTitle("Movies"))
        notify(.setLoading(true))
        
        service.fetchTopMovieList { [weak self] (response) in
            guard let self = self else { return }
            self.notify(.setLoading(false))
            switch response {
            case .success(let result):
                self.movieList = result.feed.results
                let presentations = result.feed.results.map({ MoviePresentation(movie: $0) })
                self.notify(.showMovieList(presentations))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func selectMovie(at index: Int) {
        let list = movieList[index]
        let controller = MovieDetailViewModel(presentation: list)
        delegate?.navigate(to: .detail(controller))
    }
    private func notify(_ output: MovieListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
