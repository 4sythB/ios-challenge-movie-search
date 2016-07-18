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
    var rating: Double
    var overview: String
    var poster: String
    
    init?(dictionary: [String : AnyObject]) {
        guard let title = dictionary[kTitle] as? String,
            rating = dictionary[kRating] as? Double,
            overview = dictionary[kOverview] as? String,
            poster = dictionary[kPoster] as? String else { return nil }
        
        guard let imageURL = NSURL(string: "http://image.tmdb.org/t/p/w500")?.URLByAppendingPathComponent(poster) else { return nil }
        
        self.title = title
        self.rating = rating
        self.overview = overview
        self.poster = String(imageURL) 
    }
}
