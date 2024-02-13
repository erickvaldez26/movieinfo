//
//  LoginRouter.swift
//  MovieInfo
//
//  Created by Erick Valdez on 10/02/24.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> LoginViewController {
        let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "LoginStoryboard") as! LoginViewController
        
        let loginDataSource = LoginDataSourcesManager()
        let interactor = LoginInteractor(dataSourceManager: loginDataSource)
        let router = LoginRouter()
        let presenter = LoginPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        return view
    }
    
    func goToHome(navigationController: UINavigationController) {
        print("APP: Navigate to Home")
        //navigationController.pushViewController(HomeRouter.createModule(), animated: true)
    }
    
    func showAlertError(errorMessage: String, fromViewController viewController: UIViewController) {
        let alert = UIAlertController(title: "Something went wrong :c", message: errorMessage, preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "Accept", style: .default)
        
        alert.addAction(acceptAction)
        
        viewController.present(alert, animated: true)
    }
}
