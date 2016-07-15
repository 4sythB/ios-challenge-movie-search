//
//  MovieListTableViewController.swift
//  MovieSearch
//
//  Created by Brad on 7/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController, UISearchBarDelegate, MovieTableViewCellDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Search
    
    func searchBarSearchButtonTapped(searchBar: UISearchBar) {
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    /*
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        
        if let searchTerm = searchBar.text {
            MovieController.getMovies(searchTerm, completion: { (movie) in
                if let movie = movie {
                    cell.updateWithMovie(movie)
                }
            })
        }
    
        cell.delegate = self

        return cell
    }
}
