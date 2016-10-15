//
//  ViewController.swift
//  MyFavMovies
//
//  Created by Héctor Moreno on 15/10/16.
//  Copyright © 2016 Héctor Moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instanse.loadedMovies.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let movie = DataService.instanse.loadedMovies[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            cell.configuraton(movie)
            return cell
        } else {
            let cell = MovieCell()
            cell.configuraton(movie)
            return cell
        }
    }

}

