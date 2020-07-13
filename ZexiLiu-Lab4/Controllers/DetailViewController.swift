//
//  DetailViewController.swift
//  ZexiLiu-Lab4
//
//  Created by Mike Liu on 7/11/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var voteAvgLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var overviewText: UITextView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var isFavorite: Bool = false
    
    var model = Model()
    
    //init local storage
    let defaults = UserDefaults.standard
    
    
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        titleLabel.text = ""
        releaseDateLabel.text = ""
        voteAvgLabel.text = ""
        overviewText.text = ""
        
        
        guard movie != nil else {
            return
        }
        
        titleLabel.text = movie?.title
        releaseDateLabel.text = movie?.release_date
        voteAvgLabel.text = String(format: "%f", movie!.vote_average)
        if let imagePath = movie?.poster_path {
            let imageFullPath = model.getImgPath(imagePath)
            guard let imageUrl = URL(string: imageFullPath) else { return }
            guard let data = try? Data(contentsOf: imageUrl) else { return }
            guard let image = UIImage(data: data) else { return }
            posterImage.image = image
            
        }
        
        let favoriteMovies = defaults.object(forKey: "favorites") as? [Int] ?? [Int]()
        
        if(favoriteMovies.count > 0) {
            for movieId in favoriteMovies {
                if(self.movie?.id == movieId) {
                    //the movie is already in favorite list
                    isFavorite = true
                }
            }
        }
        
        favoriteButton.setTitle(getFavoriteBtnTitle(self.isFavorite), for: .normal)
        overviewText.text = movie?.overview
    }
    
    
    
    @IBAction func favoriteBtnClicked(_ sender: Any) {
        var favoriteMovies = defaults.object(forKey: "favorites") as? [Int] ?? [Int]()
        if(self.isFavorite) {
            for i in 0...favoriteMovies.count - 1 {
                if(favoriteMovies[i] == self.movie?.id) {
                    favoriteMovies.remove(at: i)
                    defaults.set(favoriteMovies, forKey: "favorites")
                    break
                }
            }
        } else {
            favoriteMovies.append((self.movie?.id)!)
            defaults.set(favoriteMovies, forKey: "favorites")
        }
        
        self.isFavorite = !self.isFavorite
        favoriteButton.setTitle(getFavoriteBtnTitle(self.isFavorite), for: .normal)
    }
    
    func getFavoriteBtnTitle(_ isFavorite: Bool) -> String {
        if(isFavorite) {
            return "delete from favorite"
        } else {
            return "add to favorite movies"
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
