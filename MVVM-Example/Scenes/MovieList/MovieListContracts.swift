//
//  MovieListContracts.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 9.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
//***************************************************************11111111******************************************************************
//protocol MovieListViewModelProtocol{
//    var delegate : MovieListViewModelDelegate? { get set }
//    func load()
//    func selectedMoview(at Index: Int)
//}
protocol MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate? { get set }
    func load()
    func selectMovie(at index: Int)
    func showImageMovie()
}

enum MovieListViewModelOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showMovieList([MoviePresentation])
}
// * Daha sonra bu MovieListViewModelOutput handle edecek bir fonksiyon yazıyoruz
// * Class tanımladık çünkü daha sonra weak eklediğimizde tekrar gelip weak yazmamak için

enum showMovie {
    case detail(MovieDetailProtocol)
    case showImageDetail(MovieWithImageProtocol)
}


protocol MovieListViewModelDelegate: class {
    func handleViewModelOutput(_ output: MovieListViewModelOutput)
    func navigate(to route:  showMovie)
}

//enum MovieListViewModelOutput: Equatable {
//
//    // View Modelin Çıktılar
//    case updateTitle(String)
//    case setLoading(Bool)
//    case showMovieList([MovieListPresentation]) // Ekranda gözükmesi gereken struct
//}
//enum MovieListViewModelOutput: Equatable {
//    case updateTitle(String)
//    case setLoading(Bool)
//    case showMovieList([MoviePresentation])
//}






// Özet :
/*
 ilk olarak view load etti kendini bu view modeilimzin üzerindeki load çağrıldı
 ilk başta setloading diyeceğiz true olarak
 daha sonra bize bir cevap döndüğünde sunucudan/API dan setloading false diyeceğiz
 Sonrasında gelen movieleri presentation objelerine çevirip  show movie list
 outputunu üreticez çağırıcaz bir array göndericez buradan
 Bu delegetae üzerinden bu outputa iletiyor olacağız sürekli
 
 */
