//
//  FavoriteMovieViewCell.swift
//  ZexiLiu-Lab4
//
//  Created by Mike Liu on 7/13/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import Foundation
import UIKit
class FavoriteMovieViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet weak var movieImage: UIImageView!
    var movie: Movie?
    @IBOutlet weak var movieTitle: UILabel!
    func setMovie(_ movie: Movie) {
            
            self.movie = movie
            guard self.movie != nil else {
                return
            }
        self.movieTitle.text = movie.title
            
        }
        
        func setImage(_ image: UIImage) {
            self.movieImage.image = image
        }
}
