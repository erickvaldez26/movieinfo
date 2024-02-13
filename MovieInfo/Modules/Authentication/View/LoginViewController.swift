//
//  LoginViewController.swift
//  MovieInfo
//
//  Created by Erick Valdez on 10/02/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var signInButton: CustomButton!
    
    var presenter: LoginPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        
        /// Se ejecuto sol una vez para crear los seeds
        // presenter?.startCreateUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        errorLabel.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        errorLabel.isHidden = true
    }

    func configUI() {
        titleLabel.text = "Start Your\nCinematic\nJourney!"
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    func presentErrorMessage(message: String?) {
        guard let error = message else {
            errorLabel.isHidden = true
            errorLabel.text = ""
            return
        }
        
        errorLabel.isHidden = false
        errorLabel.text = error
    }
    
    @objc func textFieldDidChange() {
        let resultValidate = presenter?.validateLoginForm(email: emailTextField.text!, password: passwordTextField.text!)
        let isValid = resultValidate?.isValid
        signInButton.isEnabled = isValid!
        presentErrorMessage(message: resultValidate?.errorMessage)
    }
    
    @IBAction func signInAction(_ sender: Any) {
        presenter?.startValidateUser(email: emailTextField.text!, password: passwordTextField.text!)
    }
}

extension LoginViewController: LoginViewProtocol {
    func successVerifyUser() {
        presenter?.goToHome(navigationController: navigationController!)
    }
    
    func failureVerifyUser(errorMessage: String) {
        emailTextField.text = .empty
        passwordTextField.text = .empty
        signInButton.isEnabled = false
        presenter?.showAlertError(errorMessage: errorMessage, fromViewController: self)
    }
}
