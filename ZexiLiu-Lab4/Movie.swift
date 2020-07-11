//
//  Movie.swift
//  ZexiLiu-Lab4
//
//  Created by Mike Liu on 7/10/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import Foundation

struct Movie: Decodable {
 let id: Int!
 let poster_path: String?
 let title: String
 let release_date: String
 let vote_average: Double
 let overview: String
 let vote_count:Int!
} 
