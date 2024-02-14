//
//  HomeDataSourceProtocol.swift
//  MovieInfo
//
//  Created by Erick Valdez on 9/02/24.
//

import Foundation
import Alamofire
import CoreData
import UIKit

typealias MoviesResponse = (Result<Movies, AFError>) -> Void

protocol HomeDataSourceProtocol {
    func getMovies(callbackHandler: @escaping MoviesResponse)
    func insertMoviesBackup(movies: Movies)
}

class HomeDataSourceManager: HomeDataSourceProtocol {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getMovies(callbackHandler: @escaping MoviesResponse) {
        ServiceRouter.sessionManager.request(ServiceRouter.movies).validate().responseDecodable(of: Movies.self) { response in
            callbackHandler(response.result)
        }
    }
    
    func insertMoviesBackup(movies: Movies) {
        context.performAndWait {
            for movie in movies.results {
                ///Guardar en la base de datos
            }
        }
        
    }
}
