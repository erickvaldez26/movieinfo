//
//  LoginPresenter.swift
//  MovieInfo
//
//  Created by Erick Valdez on 10/02/24.
//

import Foundation
import UIKit

class LoginPresenter: LoginPresenterProtocol {
    private let view: LoginViewProtocol?
    private let interactor: LoginInteractorProtocol?
    private let router: LoginRouterProtocol?
    
    init(view: LoginViewProtocol?, interactor: LoginInteractorProtocol?, router: LoginRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func startCreateUser() {
        interactor?.createUser()
    }
    
    func validateIfUserLogged(navigationController: UINavigationController) {
        /// Normalmente esta validacion se realiza en el splash de la app, para evitar malas experiencias de usuario o errores visuales
        let email = UserDefaults.standard.string(forKey: "email")
        
        if let email = email {
            if !email.isEmpty {
                router?.goToHome(navigationController: navigationController)
            }
        }
    }
    
    func startValidateUser(email: String, password: String) {
        interactor?.validateUser(email: email, password: password, callback: { [self] result in
            switch result {
            case .success(_):
                self.view?.successVerifyUser()
            case .failure(let error):
                switch error {
                case .genericError:
                    self.view?.failureVerifyUser(errorMessage: "Something went wrong during the login verification.")
                case .invalidAuthentication:
                    self.view?.failureVerifyUser(errorMessage: "Incorrect email or password")
                }
                print(error)
            }
        })
    }
    
    func goToHome(navigationController: UINavigationController) {
        router?.goToHome(navigationController: navigationController)
    }
    
    func validateLoginForm(email: String, password: String) -> (isValid: Bool, errorMessage: String?) {
        if !email.isEmpty && !password.isEmpty {
            if email.validateEmail() && password.validatePassword() {
                return (true, nil)
            } else {
                return (false, "Enter correct Email or Correct password format.")
            }
        } else {
            return (false, "All fields are mandatory.")
        }
    }
    
    func showAlertError(errorMessage: String, fromViewController viewController: UIViewController) {
        router?.showAlertError(errorMessage: errorMessage, fromViewController: viewController)
    }
}
