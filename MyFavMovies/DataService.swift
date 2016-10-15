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
        let moviesData = NSKeyedArchiver.archivedDataWithRootObject(_loadedMovies)
        NSUserDefaults.standardUserDefaults().setObject(moviesData, forKey: "movies")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    func loadMovies() {
        if let moviesData = NSUserDefaults.standardUserDefaults().objectForKey("movies") as? NSData {
            if let moviesArray = NSKeyedUnarchiver.unarchiveObjectWithData(moviesData) as? [Movie] {
                _loadedMovies = moviesArray
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "moviesLoaded", object: nil))
    }
    
    func saveImageAndCreatePath(image: UIImage) -> String {
        let imageData = UIImagePNGRepresentation(image)
        let imagePath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imagePath)
            imageData?.writeToFile(fullPath, atomically: true)
        return imagePath
    }
    
    func imageForPath(path: String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }

    func addMovies(movie: Movie){
        self._loadedMovies.append(movie)
        saveMovies()
        loadMovies()
    
    }
    
    func documentsPathForFileName(name: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }

}