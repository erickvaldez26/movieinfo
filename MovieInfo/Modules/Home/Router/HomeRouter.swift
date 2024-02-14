//
//  HomeRouter.swift
//  MovieInfo
//
//  Created by Erick Valdez on 13/02/24.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    static func createModule() -> HomeViewController {
        let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let dataSource = HomeDataSourceManager()
        let interactor = HomeInteractor(dataSourceManager: dataSource)
        let router = HomeRouter()
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        return view
    }
}
