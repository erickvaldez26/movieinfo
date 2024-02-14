//
//  PresenterRouter.swift
//  MovieInfo
//
//  Created by Erick Valdez on 13/02/24.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    private let view: HomeViewProtocol?
    private let interactor: HomeInteractorProtocol?
    private let router: HomeRouterProtocol?
    
    init(view: HomeViewProtocol?, interactor: HomeInteractorProtocol?, router: HomeRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func startFetchMovies() {
        interactor?.fetchMovies(callback: { [self] result in
            switch result {
            case .success(let data):
                self.view?.successFetchMovies(data: data)
            case .failure(_):
                self.view?.failureFetchMovies()
            }
        })
    }
}
