//
//  MovieDetailVC.swift
//  MyFavMovies
//
//  Created by Héctor Moreno on 15/10/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit

class MovieDetailVC: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var linkLbl: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieImage.layer.cornerRadius = movieImage.frame.size.width / 2
        movieImage.clipsToBounds = true
        
        movieImage.image = DataService.instanse.imageForPath(movie.imagePath)
        titleLbl.text = movie.title
        descLbl.text = movie.movieDescription
        linkLbl.text = movie.link
    }

   
}
