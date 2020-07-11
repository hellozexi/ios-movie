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
}
