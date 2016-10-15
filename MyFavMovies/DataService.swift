//
//  DataService.swift
//  MyFavMovies
//
//  Created by Héctor Moreno on 15/10/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    static let instanse = DataService()
    private var _loadedMovies = [Movie]()
    
    var loadedMovies: [Movie]{
        return _loadedMovies
    }
    
    func saveMovies() {
    
    }

    func loadMovies() {
    
    }

    func addMovies(movie: Movie){
        self._loadedMovies.append(movie)
        saveMovies()
        loadMovies()
    
    }

}