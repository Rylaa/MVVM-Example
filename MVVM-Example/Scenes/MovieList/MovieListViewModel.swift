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
    
    
    weak var delegate: MovieListViewModelDelegate? // Burada weak dediğimiz için Contractstaki Delegate protocülene class eklemiştik
    // o classı silip test et
    let service : topMovieService!
    
    init(service: topMovieService) {
        self.service = service
    }
    
    func load( ) { // Load içerisinde  Servis çağırmamız gerekiyor
        print("asdasdas")
        notify(.updateTitle("Movies"))
        notify(.setLoading(true))
        
        service.fetchTopMovieList { [weak self] (response) in
            guard let strongSelf = self else { return }
            strongSelf.notify(.setLoading(false))
            switch response {
            case .success(let result):
                let movies = result.feed.results
                let presentations = movies.map({ MoviePresentation(movie: $0) })
                strongSelf.notify(.showMovieList(presentations))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func selectMovie(at index: Int) {
        // TODO: Implement..

    }
    
    private func notify(_ output: MovieListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
        
    }
}
