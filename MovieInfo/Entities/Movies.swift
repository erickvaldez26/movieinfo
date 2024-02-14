//
//  File.swift
//  MovieInfo
//
//  Created by Erick Valdez on 9/02/24.
//

import Foundation

struct Movies: Codable {
    let page: Int
    let results: [MovieDetails]
    let total_pages: Int
    let total_results: Int
}
