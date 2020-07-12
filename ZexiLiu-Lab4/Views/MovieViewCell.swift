//
//  MovieViewCell.swift
//  ZexiLiu-Lab4
//
//  Created by Mike Liu on 7/11/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import Foundation
import UIKit
class MovieViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titel: UILabel!
    var movie: Movie?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    func getImgPath(_ url: String) -> String {
//        return "https://image.tmdb.org/t/p/w200\(url)"
//    }
    
    func setMovie(_ movie: Movie) {
        
        self.movie = movie
        guard self.movie != nil else {
            return
        }
        self.titel.text = movie.title
//        guard let imagePath = movie.poster_path else { return  }
//        let imageFullPath = self.getImgPath(imagePath)
//        guard let imageUrl = URL(string: imageFullPath) else { return  }
//        guard let data = try? Data(contentsOf: imageUrl) else { return }
//        guard let image = UIImage(data: data) else { return  }
//        self.posterImage.image = image
        
    }
    
    func setImage(_ image: UIImage) {
        self.posterImage.image = image
    }
    
}
