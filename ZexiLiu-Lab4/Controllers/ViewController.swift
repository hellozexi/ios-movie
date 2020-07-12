//
//  ViewController.swift
//  ZexiLiu-Lab4
//
//  Created by Mike Liu on 7/9/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ModelDelegate {
    
    
   
    

    @IBOutlet weak var moviesCollection: UICollectionView!
    var model = Model()
    var movies = [Movie]()
    var images = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        moviesCollection.delegate = self
        moviesCollection.dataSource = self
        model.delegate = self
        model.getMovies()
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
       }
       
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieViewCell
       
       // Configure the cell with the data
        //dump(indexPath)
    if(indexPath.item < images.count) {
        cell.setImage(images[indexPath[1]])
    }
    let movie = self.movies[indexPath.item]
       
       cell.setMovie(movie)
       // Return the cell
       return cell
       
   }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func moviesFetched(_ movies: [Movie], _ images: [UIImage]) {
        self.movies = movies
        self.images = images
        moviesCollection.reloadData()
        //self.cacheImage()
    }
}

