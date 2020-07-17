//
//  ViewController.swift
//  ZexiLiu-Lab4
//
//  Created by Mike Liu on 7/9/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate, ModelDelegate {
    
    
    @IBOutlet weak var theSpinner: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    

    @IBOutlet weak var moviesCollection: UICollectionView!
    var model = Model()
    var movies = [Movie]()
    var images = [UIImage]()
    let defaults = UserDefaults.standard
    let cellPerRow = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        setUpLayoutForCollectionView()
        // Do any additional setup after loading the view.
        moviesCollection.delegate = self
        moviesCollection.dataSource = self
        searchBar.delegate = self
        model.delegate = self
        //model.getMovies("love")
        theSpinner.hidesWhenStopped = true
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
       }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        if(movies.count % cellPerRow == 0) {
//            return self.movies.count/cellPerRow
//        } else {
//            return self.movies.count/cellPerRow + 1
//        }
//        
//    }
    func setUpLayoutForCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width/CGFloat(cellPerRow)-10
        let height = width * 1.5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        moviesCollection.collectionViewLayout = layout
    }
    
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath)
       
       // Configure the cell with the data
        //dump(indexPath)
        let index = indexPath.section * cellPerRow + indexPath.row
    
    
    let label = UILabel()
    let labelSize: CGFloat = 40
    let labelFrame = CGRect(x: 0, y: cell.frame.height - labelSize, width: cell.frame.width, height: labelSize)
    label.frame = labelFrame
    label.textColor = UIColor.white
    label.textAlignment = NSTextAlignment.center
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 13.0)
    label.text = index < movies.count ? movies[index].title : ""
    label.backgroundColor = index < movies.count ? UIColor(red: 0, green: 0, blue: 0, alpha: 0.5) : UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    
    let imageFrame = CGRect(x: 0, y: 0, width: cell.frame.width , height: cell.frame.height )
               let imageView = UIImageView()
               imageView.frame = imageFrame
    imageView.image = index < images.count ? images[index] : UIImage()
    cell.addSubview(imageView)
    cell.addSubview(label)
       // Return the cell
       return cell
       
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        let indexPath = self.moviesCollection!.indexPath(for: cell)
        
        let selectedMovie = movies[indexPath!.row]
        let detailVC = segue.destination as! DetailViewController
        detailVC.movie = selectedMovie
        
        
    }
    
    
    //search bar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange: String){
        // clean current list
        // pull data from API
        
        theSpinner.startAnimating()
        self.moviesCollection.reloadData()
        self.model.getMovies(textDidChange)
            
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.section * cellPerRow + indexPath.row
        if(index >= movies.count) {
            return
        }
        let detailVC = storyboard!.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        detailVC.movie = movies[index]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func moviesFetched(_ movies: [Movie], _ images: [UIImage]) {
        self.movies = movies
        self.images = images
        
        //DispatchQueue.main.async {
        self.moviesCollection.reloadData()
        self.theSpinner.stopAnimating()
        //}
        //self.cacheImage()
    }
}

