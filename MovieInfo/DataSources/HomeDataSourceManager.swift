//
//  HomeDataSourceProtocol.swift
//  MovieInfo
//
//  Created by Erick Valdez on 9/02/24.
//

import Foundation
import Alamofire

typealias MoviesResponse = (Result<Movies, AFError>) -> Void

protocol HomeDataSourceProtocol {
    func getMovies(callbackHandler: @escaping MoviesResponse)
}

class HomeDataSourceManager: HomeDataSourceProtocol {
    func getMovies(callbackHandler: @escaping MoviesResponse) {
        ServiceRouter.sessionManager.request(ServiceRouter.movies).validate().responseDecodable(of: Movies.self) { response in
            callbackHandler(response.result)
        }
    }
}
