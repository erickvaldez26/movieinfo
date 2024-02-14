//
//  MovieTableViewCell.swift
//  MovieInfo
//
//  Created by Erick Valdez on 13/02/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    let identifier = "MovieCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configUI(movie: MovieDetails) {
        /// Mostrar la imagen de la pelicula consultando la url correspondiente (TempConstants.baseImageURL + "\(movie.poster_path)")
        titleLabel.text = movie.original_title
        releaseDateLabel.text = movie.release_date
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
