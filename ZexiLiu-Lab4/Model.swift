//
//  model.swift
//  ZexiLiu-Lab4
//
//  Created by Mike Liu on 7/9/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import Foundation

class Model {
    //fetch movies from TMDB
    func getMovies() {
        let url = URL(string: Constants.URL)
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) {
            (data, response, error) in
            if (error != nil || data == nil) {
                return
            }
            print(data!)
        }
        
        dataTask.resume()
    }
}
