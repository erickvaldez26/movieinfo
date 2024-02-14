//
//  HomeProtocols.swift
//  MovieInfo
//
//  Created by Erick Valdez on 13/02/24.
//

import Foundation

protocol HomeViewProtocol {
    func successFetchMovies(data: Movies)
    func failureFetchMovies()
}

protocol HomePresenterProtocol {
    func startFetchMovies()
}

protocol HomeInteractorProtocol {
    func fetchMovies(callback: @escaping (Result<Movies, RequestError>) -> Void)
}

protocol HomeRouterProtocol {
    static func createModule() -> HomeViewController
}
