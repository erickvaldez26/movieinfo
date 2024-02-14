//
//  HomeViewController.swift
//  MovieInfo
//
//  Created by Erick Valdez on 13/02/24.
//

import UIKit

class HomeViewController: UIViewController {

    var presenter: HomePresenterProtocol?
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    private var moviesList: [MovieDetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchMovies()
        configTableView()
    }
    
    private func fetchMovies() {
        ///Mostrar skeleton
        presenter?.startFetchMovies()
    }
    
    private func configTableView() {
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        
        moviesTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: MovieTableViewCell().identifier)
    }
}

extension HomeViewController: HomeViewProtocol {
    func successFetchMovies(data: Movies) {
        ///Ocultar skeleton
        moviesList = data.results
        moviesTableView.reloadData()
    }
    
    func failureFetchMovies() {
        ///Ocultar skeleton y mostrar error
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell().identifier, for: indexPath) as! MovieTableViewCell
        cell.configUI(movie: moviesList[indexPath.row])
        
        return cell
    }
}
