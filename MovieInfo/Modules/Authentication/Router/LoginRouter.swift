//
//  LoginRouter.swift
//  MovieInfo
//
//  Created by Erick Valdez on 10/02/24.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    static func createModule() -> LoginViewController {
        let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "LoginStoryboard") as! LoginViewController
        
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        return view
    }
}
