//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Brad on 7/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell, UISearchBarDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    weak var delegate: MovieTableViewCellDelegate?
    
    var movie: Movie?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateWithMovie(movie: Movie) {
        self.movie = movie
        
        titleLabel.text = movie.title
        ratingLabel.text = String(movie.rating)
        descriptionLabel.text = movie.overview
        ImageController.imageForURL(movie.poster) { (image) in
            guard let image = image else { return }
            self.posterImageView.image = image
        }
    }
}

protocol MovieTableViewCellDelegate: class {
    
}
