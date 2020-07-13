//
//  Movie.swift
//  ZexiLiu-Lab4
//
//  Created by Mike Liu on 7/10/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import Foundation

struct Movie: Decodable, Encodable {
    let id: Int!
    let poster_path: String?
    let title: String
    let release_date: String
    let vote_average: Double
    let overview: String
    let vote_count:Int!
    
    enum CodingKeys: String, CodingKey {
        case id
        case poster_path
        case release_date
        case title
        case vote_average
        case overview
        case vote_count
    }
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.id = try container.decode(Int.self, forKey: .id)
        self.poster_path = try container.decode(String.self, forKey: .poster_path)
        self.release_date = try container.decode(String.self, forKey: .release_date)
        self.vote_average = try container.decode(Double.self, forKey: .vote_average)
        self.overview = try container.decode(String.self, forKey: .overview)
        self.vote_count = try container.decode(Int.self, forKey: .vote_count)
    }
}




