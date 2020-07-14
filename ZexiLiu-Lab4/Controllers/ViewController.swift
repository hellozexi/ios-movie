//
//  ViewController.swift
//  ZexiLiu-Lab4
//
//  Created by Mike Liu on 7/9/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate, ModelDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    

    @IBOutlet weak var moviesCollection: UICollectionView!
    var model = Model()
    var movies = [Movie]()
    var images = [UIImage]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        moviesCollection.delegate = self
        moviesCollection.dataSource = self
        searchBar.delegate = self
        model.delegate = self
        model.getMovies("love")
        
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexes = moviesCollection.indexPathsForSelectedItems {
            let selectedMovie = movies[indexes[0].row]
            let detailVC = segue.destination as! DetailViewController
            detailVC.movie = selectedMovie
        } else {
            return
        }
        
        
        
    }
    
    
    //search bar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange: String){
        // clean current list
        // pull data from API
        if (textDidChange != ""){
            model.getMovies(textDidChange)
        }
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

