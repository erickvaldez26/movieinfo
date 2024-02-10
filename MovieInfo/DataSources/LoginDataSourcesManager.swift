//
//  LoginDataSourcesManager.swift
//  MovieInfo
//
//  Created by Erick Valdez on 10/02/24.
//

import Foundation
import CoreData
import UIKit

enum ErrorUserValidation: Error {
    case genericError
    case invalidAuthentication
}

typealias UserCreateResponse = (Result<String, NSError>) -> Void
typealias UserResponse = (Result<User, ErrorUserValidation>) -> Void

protocol LoginDataSourceProtocol {
    func seededUser(callbackHandler: @escaping UserCreateResponse)
    func validateUser(email: String, password: String, callbackHandler: @escaping UserResponse)
}

class LoginDataSourcesManager: LoginDataSourceProtocol {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func seededUser(callbackHandler: @escaping UserCreateResponse) {
        let newUser = User(context: context)
        newUser.username = "User Test"
        newUser.email = "test@email.com"
        newUser.password = "123456lol#"
        
        do {
            try context.save()
            
            callbackHandler(.success("Usuario registrado correctamente"))
        } catch let error {
            print("Error al guardar el usuario")
            callbackHandler(.failure(error as NSError))
        }
    }
    
    func validateUser(email: String, password: String, callbackHandler: @escaping UserResponse) {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %$", email)
        fetchRequest.predicate = NSPredicate(format: "password == %$", password)
        
        do {
            let user = try context.fetch(fetchRequest)
            
            guard let user = user.first else {
                callbackHandler(.failure(.invalidAuthentication))
                return
            }
            
            callbackHandler(.success(user))
        } catch let error {
            print("Error al obtener el usuario")
            callbackHandler(.failure(.genericError))
        }
    }
}
