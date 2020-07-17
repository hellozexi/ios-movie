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
    
    var movie: Movie?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    func getImgPath(_ url: String) -> String {
//        return "https://image.tmdb.org/t/p/w200\(url)"
//    }
    
    func setMovie(_ movie: Movie) {
        let label = UILabel()
        let labelSize: CGFloat = 40
        let labelFrame = CGRect(x: 0, y: self.frame.height - labelSize, width: self.frame.width, height: labelSize)
        label.frame = labelFrame
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13.0)
        self.movie = movie
        guard self.movie != nil else {
            return
        }
        label.text = movie.title
        self.addSubview(label)
//        guard let imagePath = movie.poster_path else { return  }
//        let imageFullPath = self.getImgPath(imagePath)
//        guard let imageUrl = URL(string: imageFullPath) else { return  }
//        guard let data = try? Data(contentsOf: imageUrl) else { return }
//        guard let image = UIImage(data: data) else { return  }
//        self.posterImage.image = image
        
    }
    
    func setImage(_ image: UIImage) {
        let imageFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        let imageView = UIImageView()
        imageView.frame = imageFrame
        imageView.image = image
        self.addSubview(imageView)
    }
    
}
