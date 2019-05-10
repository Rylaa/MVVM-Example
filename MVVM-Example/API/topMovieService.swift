//
//  movieResponse.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 9.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
import Alamofire

final class topMovieService {
    
    static let shared = topMovieService()
    init() {}
    func fetchTopMovieList ( completion : @escaping (ApıResult<JSON>)-> Void) {
        let urlString = "https://rss.itunes.apple.com/api/v1/tr/movies/top-movies/all/25/explicit.json"
        AF.request(URL(string: urlString)!).responseData { (DataResponse) in
            switch DataResponse.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let Result = try decoder.decode(JSON.self, from: data)
                    completion(.success(Result)) // Presentationa göndereceğimiz için böyle response ediyoruz
                    //                    print()
                } catch let error {
                    completion(.failure(serializationError.serializationError(internal: error)))
                }
            case .failure(let error):
                completion(.failure(serializationError.serializationError(internal: error)))
            }
        }
    }
}

