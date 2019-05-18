//
//  MovieWithImageContracts.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 18.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation


protocol MovieWithImageProtocol {
    var delegate : MovieWithImageDelegate? { get set }
    func load()
}

enum MovieWithImageOutputs {
    case showList([movieWithImagePresentation])
    case setLoading(Bool)
    case pageTitle(String)
}

protocol MovieWithImageDelegate : class {
    func handleViewModelOutput(_ outPuts: MovieWithImageOutputs )
}

/*
 işin özeti:
Navigation bar daki buttona tıklanıldığın da ekran olan mevcut Listi yeni bir ekranda yeni bir list ile
 image ile listelenmesi
 
 */
