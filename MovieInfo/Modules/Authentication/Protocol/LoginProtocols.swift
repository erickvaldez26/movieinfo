//
//  LoginProtocols.swift
//  MovieInfo
//
//  Created by Erick Valdez on 10/02/24.
//

import Foundation

protocol LoginViewProtocol {
    func successFetchMovies()
    func failureFetchMovies()
}

protocol LoginPresenterProtocol {
    func startFetchingMovies()
}

protocol LoginInteractorProtocol {
    func fetchMovies()
}

protocol LoginRouterProtocol {
    static func createModule() -> LoginViewController
}
