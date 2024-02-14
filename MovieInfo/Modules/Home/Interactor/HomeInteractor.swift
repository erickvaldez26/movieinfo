//
//  HomeInteractor.swift
//  MovieInfo
//
//  Created by Erick Valdez on 13/02/24.
//

import Foundation

enum RequestError: Error {
    case genericError
    case noInternet
}

class HomeInteractor: HomeInteractorProtocol {
    private let dataSourceManager: HomeDataSourceProtocol?
    
    init(dataSourceManager: HomeDataSourceProtocol?) {
        self.dataSourceManager = dataSourceManager
    }
    
    func fetchMovies(callback: @escaping (Result<Movies, RequestError>) -> Void) {
        if !Connectivity.isConnectedToInternet() {
            ///Ejecutar funcion para consultar las peliculas guardadas por coreData
            callback(.failure(.noInternet))
        }
        
        dataSourceManager?.getMovies(callbackHandler: { [self] result in
            switch result {
            case .success(let data):
                self.dataSourceManager?.insertMoviesBackup(movies: data)
                callback(.success(data))
            case .failure(let error):
                if let error = error.underlyingError as Error? {
                    callback(.failure(.genericError))
                }
            }
        })
    }
}
