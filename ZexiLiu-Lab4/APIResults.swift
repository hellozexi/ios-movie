//
//  APIResults.swift
//  ZexiLiu-Lab4
//
//  Created by Mike Liu on 7/10/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import Foundation

struct APIResults:Decodable {
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case total_results
        case total_pages
        case results
    }
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.page = try container.decode(Int.self, forKey: .page)
        self.total_pages = try container.decode(Int.self, forKey: .total_pages)
        self.total_results = try container.decode(Int.self, forKey: .total_results)
        self.results = try container.decode([Movie].self, forKey: .results)
        
    }
}
