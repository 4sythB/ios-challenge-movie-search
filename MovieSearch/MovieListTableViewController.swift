//
//  MovieListTableViewController.swift
//  MovieSearch
//
//  Created by Brad on 7/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController, UISearchBarDelegate {
    
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Search
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        MovieController.getMovies(searchTerm) { (movies) in
            self.movies = movies
            self.tableView.reloadData()
        }
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        UIApplication.sharedApplication().sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, forEvent:nil)

    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        
        let movie = movies[indexPath.row]
        
        cell.updateWithMovie(movie)

        return cell
    }
}
