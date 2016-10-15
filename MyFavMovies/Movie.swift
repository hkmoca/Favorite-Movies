//
//  Movie.swift
//  MyFavMovies
//
//  Created by Héctor Moreno on 15/10/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import Foundation

class Movie: NSObject, NSCoding {

    private var _title: String!
    private var _description: String!
    private var _imagePath: String!
    private var _link: String!
    
    var title: String {
        return _title
    }
    
    var movieDescription: String {
        return _description
    }
    
    var imagePath: String {
        return _imagePath
    }
    
    var link: String {
        return _link
    }
    
    init(title: String, movieDescription: String, imagePath: String, link: String){
        self._title = title
        self._description = movieDescription
        self._imagePath = imagePath
        self._link = link
    }
    
    override init(){
    
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        self.init()
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._description = aDecoder.decodeObjectForKey("movieDescription") as? String
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._link = aDecoder.decodeObjectForKey("link") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._title, forKey: "title")
        aCoder.encodeObject(self._description, forKey: "movieDescription")
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        aCoder.encodeObject(self._link, forKey: "link")
    }

}