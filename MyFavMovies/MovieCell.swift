//
//  MovieCell.swift
//  MyFavMovies
//
//  Created by Héctor Moreno on 15/10/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var linkLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        movieImg.layer.cornerRadius = movieImg.frame.size.width / 2
        movieImg.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configuraton(post: Movie){
        titleLbl.text = post.title
        descriptionLbl.text = post.movieDescription
        linkLbl.text = post.link
        movieImg.image = DataService.instanse.imageForPath(post.imagePath)
        
    
    }

}
