//
//  LoginViewController.swift
//  MovieInfo
//
//  Created by Erick Valdez on 10/02/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var signInButton: CustomButton!
    
    var presenter: LoginPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }

    func configUI() {
        titleLabel.text = "Start Your\nCinematic\nJourney!"
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
    }
}

extension LoginViewController: LoginViewProtocol {
    func successFetchMovies() {
        
    }
    
    func failureFetchMovies() {
        
    }
}
