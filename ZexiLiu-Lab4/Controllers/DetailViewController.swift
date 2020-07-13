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
    
    var model = Model()
    
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
        
        overviewText.text = movie?.overview
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
