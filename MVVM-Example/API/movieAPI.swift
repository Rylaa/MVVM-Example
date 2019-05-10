//
//  movieAPI.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 9.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
//https://rss.itunes.apple.com/api/v1/tr/movies/top-movies/all/25/explicit.json
//{
//    "feed": {
//        "title": "Top Films",
//        "copyright": "Copyright © 2018 Apple Inc. All rights reserved.",
//        "country": "tr",
//        "icon": "http://itunes.apple.com/favicon.ico",
//        "updated": "2019-05-08T01:56:57.000-07:00",
//        "results": [
//        {
//        "artistName": "Ketche & Can Ulkay",
//        "id": "1451716381",
//        "releaseDate": "2018-11-15",
//        "name": "Müslüm",
//        "kind": "movie",
//        "artworkUrl100": "https://is5-ssl.mzstatic.com/image/thumb/Video114/v4/b6/94/96/b6949666-f2b7-79c3-45b4-1cf608abe082/pr_source.jpg/200x200bb.png",
//        "genres": [
//        {
//        "genreId": "4406",
//        "name": "Drama",
//        "url": "https://itunes.apple.com/tr/genre/id4406"
//        }
//        ],
//        "url": "https://itunes.apple.com/tr/movie/m%C3%BCsl%C3%BCm/id1451716381"
//        },

struct JSON : Codable {
  public let feed : Feed
}

struct Feed : Codable {
    let title     : String
    let copyright : String
    let country   : String
    let icon      : String
    let updated   : String
    let results   : [Results]
}

struct Results: Codable {
    enum CodingKeys : String, CodingKey {
        case artistName
        case releaseDate
        case name
        case kind
        case image  = "artworkUrl100"
        case copyright
        case genres
    }
    
    let artistName : String
    let releaseDate : String
    let name        : String
    let kind        : String
    let image       : URL
    let copyright   : String?
    let genres      : [Genre]
    
}

struct Genre : Codable {
    let name : String
    let url  : String
}
