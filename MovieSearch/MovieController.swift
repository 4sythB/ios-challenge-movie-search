//
//  MovieController.swift
//  MovieSearch
//
//  Created by Brad on 7/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    
    static let baseURL = NSURL(string: "http://api.themoviedb.org/3/search/movie")
    static let apiKey = "39b3b8ccedabe0c9373ba3b32a814d13"
    
    static func getMovies(searchTerm: String, completion: (movies: [Movie]) -> Void) {
        guard let url = baseURL else { fatalError("URL Optional is nil") }
        let urlParameters = ["api_key" : "\(apiKey)", "query" : "\(searchTerm.lowercaseString)", "applictation" : "json"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            guard let data = data, responseDataString = NSString(data: data, encoding: NSUTF8StringEncoding) else { return }
            
            guard let jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: [])) as? [String : AnyObject], moviesArray = jsonDictionary["results"] as? [[String : AnyObject]] else {
                print("Unable to serialize JSON. \n\(responseDataString)")
                completion(movies: [])
                return
                
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                let movies = moviesArray.flatMap { Movie(dictionary: $0) }
                completion(movies: movies)
            })
        }
    }
}