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
    let cell = moviesCollection.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath)
    
    let title = self.movies[indexPath.row].title
    //cell.textLabel?.title = title
    print(title)
    return cell
   }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func moviesFetched(_ movies: [Movie]) {
        self.movies = movies
    }
}

