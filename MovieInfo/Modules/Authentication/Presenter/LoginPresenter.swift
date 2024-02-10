//
//  LoginPresenter.swift
//  MovieInfo
//
//  Created by Erick Valdez on 10/02/24.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    private let view: LoginViewProtocol?
    private let interactor: LoginInteractorProtocol?
    private let router: LoginRouterProtocol?
    
    init(view: LoginViewProtocol?, interactor: LoginInteractorProtocol?, router: LoginRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func startFetchingMovies() {
        
    }
}
