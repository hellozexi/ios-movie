//
//  model.swift
//  ZexiLiu-Lab4
//
//  Created by Mike Liu on 7/9/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import Foundation
import UIKit
protocol ModelDelegate {
    func moviesFetched(_ movies: [Movie], _ images: [UIImage])
}


class Model {
    //fetch movies from TMDB
    var delegate: ModelDelegate?
    var numPerQuery: Int = 20
    var adultEnabled: Bool = false
    let defaults = UserDefaults.standard
    func getImgPath(_ url: String) -> String {
        return "https://image.tmdb.org/t/p/w200\(url)"
    }
    
    //var apiResults: APIResults?
    func getMovies(_ query: String) {
        let cleanedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        numPerQuery = defaults.integer(forKey: "numPerQuery")
        if(numPerQuery == 0) {
            numPerQuery = 20
        }
        adultEnabled = defaults.bool(forKey: "isAdult")
        let apiKey: String = "3cad51d50ec5ff7b806eb0306fa1410b"
        let str = adultEnabled ? "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=\(cleanedQuery!)&include_adult=true" : "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=\(cleanedQuery!)&include_adult=false"
        
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
                var results = response.results
                
                if(response.results.count > self.numPerQuery) {
                    results = Array(response.results.prefix(self.numPerQuery))
                }
                
                let images = self.cacheImage(results)
                
                DispatchQueue.main.async {
                    self.delegate?.moviesFetched(results, images)
                
                }
                    
            } catch {
                
            }
            
        }
        
        dataTask.resume()
    }
    
    
    func cacheImage(_ movies: [Movie]) -> [UIImage] {
        var images: [UIImage] = []
        var count: Int = 0
        while(count <= 20) {
            if(count > movies.count - 1) {
                break
            }
            if let imagePath = movies[count].poster_path {
                let imageFullPath = self.getImgPath(imagePath)
                guard let imageUrl = URL(string: imageFullPath) else { return images }
                guard let data = try? Data(contentsOf: imageUrl) else { return images }
                guard let image = UIImage(data: data) else { return images }
                images.append(image)
            }
            count += 1
        }
        return images
    }
}
