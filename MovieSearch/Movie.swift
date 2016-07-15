//
//  Movie.swift
//  MovieSearch
//
//  Created by Brad on 7/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class Movie {
    
    private let kTitle = "title"
    private let kRating = "vote_average"
    private let kOverview = "overview"
    private let kPoster = "poster_path"
    
    var title: String
    var rating: Int
    var overview: String
    var poster: UIImage
    
    init(title: String, rating: Int, overview: String, poster: UIImage) {
        self.title = title
        self.rating = rating
        self.overview = overview
        self.poster = poster
    }
    
    init?(dictionary: [String : AnyObject]) {
        guard let title = dictionary[kTitle] as? String,
            rating = dictionary[kRating] as? Int,
            overview = dictionary[kOverview] as? String,
            poster = dictionary[kPoster] as? String else { return nil }
        
        self.title = title
        self.rating = rating
        self.overview = overview
        
        guard let baseImageURL = NSURL(string: "http://image.tmdb.org/t/p/w500") else { return nil }
        guard let imageData = NSData(contentsOfURL: baseImageURL.URLByAppendingPathComponent(poster)) else { return nil }
        self.poster = UIImage(data: imageData)!
    }
}
