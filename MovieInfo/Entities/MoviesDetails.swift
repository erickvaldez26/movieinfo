//
//  MoviesDetails.swift
//  MovieInfo
//
//  Created by Erick Valdez on 13/02/24.
//

import Foundation

struct MovieDetails: Codable {
    var id: Int = 0
    var adult: Bool = true
    var backdrop_path: String = ""
    var original_title: String = ""
    var overview: String = ""
    var popularity: Double = 0.0
    var poster_path: String = ""
    var release_date: String = ""
    var title: String = ""
    var vote_average: Double = 0.0
    var vote_count: Int = 0
}
