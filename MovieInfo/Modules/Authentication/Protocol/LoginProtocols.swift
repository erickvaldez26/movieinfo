//
//  LoginProtocols.swift
//  MovieInfo
//
//  Created by Erick Valdez on 10/02/24.
//

import UIKit

protocol LoginViewProtocol {
    func successVerifyUser()
    func failureVerifyUser(errorMessage: String)
}

protocol LoginPresenterProtocol {
    func startCreateUser()
    func startValidateUser(email: String, password: String)
    func goToHome(navigationController: UINavigationController)
    func validateLoginForm(email: String, password: String) -> (isValid: Bool, errorMessage: String?)
    func showAlertError(errorMessage: String, fromViewController viewController: UIViewController)
}

protocol LoginInteractorProtocol {
    func createUser()
    func validateUser(email: String, password: String, callback: @escaping (Result<User, ErrorUserValidation>) -> Void)
}

protocol LoginRouterProtocol {
    static func createModule() -> LoginViewController
    func goToHome(navigationController: UINavigationController)
    func showAlertError(errorMessage: String, fromViewController viewController: UIViewController)
}
