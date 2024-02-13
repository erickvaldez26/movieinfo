//
//  LoginInteractor.swift
//  MovieInfo
//
//  Created by Erick Valdez on 10/02/24.
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {
    private let dataSourceManager: LoginDataSourceProtocol?
    
    init(dataSourceManager: LoginDataSourceProtocol?) {
        self.dataSourceManager = dataSourceManager
    }
    
    func createUser() {
        dataSourceManager?.seededUser(callbackHandler: { result in
            switch result {
            case .success(let info):
                print("APP: \(info)")
            case .failure(let error):
                print("APP-ERROR: \(error)")
            }
        })
    }
    
    func validateUser(email: String, password: String, callback: @escaping (Result<User, ErrorUserValidation>) -> Void) {
        dataSourceManager?.validateUser(email: email, password: password, callbackHandler: { [self] result in
            switch result {
            case .success(let data):
                self.saveCredentials(user: data)
                callback(.success(data))
            case .failure(let error):
                callback(.failure(error))
            }
        })
    }
    
    private func saveCredentials(user: User) {
        let defaults = UserDefaults.standard
        defaults.set(user.username, forKey: "username")
        defaults.set(user.email, forKey: "email")
    }
}
