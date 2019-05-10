//
//  MovieListPresentation.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 9.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation

//struct MovieListPresentation {
//    
//    let artistName : String
//    let name       : String
//    
//}
//
//extension MovieListPresentation {
//    
//    init(movie : Results) {
//        self.artistName = movie.artistName
//        self.name   = movie.name
//        
//    }
//}




final class MoviePresentation: NSObject {
    
    let title: String
    let detail: String
    
    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? MoviePresentation else { return false }
        return self.title == other.title && self.detail == other.detail
    }
}


extension MoviePresentation {
    
    convenience init(movie: Results) {
        self.init(title: movie.name,
                  detail: movie.artistName)
    }
}
