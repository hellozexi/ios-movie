//
//  model.swift
//  ZexiLiu-Lab4
//
//  Created by Mike Liu on 7/9/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func moviesFetched(_ movies: [Movie])
}


class Model {
    //fetch movies from TMDB
    var delegate: ModelDelegate?
    
    //var apiResults: APIResults?
    func getMovies() {
        let apiKey: String = "3cad51d50ec5ff7b806eb0306fa1410b"
        let str = "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=love"
        
        let url = URL(string: str)
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) {
            (data, response, error) in
            if (error != nil || data == nil) {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                let response = try decoder.decode(APIResults.self, from: data!)
                if(response.results != nil) {
                    self.delegate?.moviesFetched(response.results)
                }
                
                dump(response)
            } catch {
                
            }
            
        }
        
        
        
        dataTask.resume()
    }
}
