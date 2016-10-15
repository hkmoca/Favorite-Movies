//
//  AddMovieVC.swift
//  MyFavMovies
//
//  Created by Héctor Moreno on 15/10/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var linkField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieImage.layer.cornerRadius = movieImage.frame.size.width / 2
        movieImage.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }

    @IBAction func createBtnPressed(sender: AnyObject){
        if let title = titleField.text, let desc = descField.text, let link = linkField.text, let image = movieImage.image {
        
            let imagePath = DataService.instanse.saveImageAndCreatePath(image)
            
            let movie = Movie(title: title, movieDescription: desc, imagePath: imagePath, link: link)
            DataService.instanse.addMovies(movie)
            self.navigationController?.popViewControllerAnimated(true)
        }
    
    }
    
    @IBAction func addPicBtnPressed(sender: UIButton){
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImage.image = image
    }
    
    
}
