//
//  FavoriteViewController.swift
//  ZexiLiu-Lab4
//
//  Created by Mike Liu on 7/13/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var model = Model()
    var favoriteMovies: [Movie] = [Movie]()
    var images: [UIImage] = [UIImage]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //getFavoriteMovies()
        return favoriteMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "favoriteMovieCell", for: indexPath) as! FavoriteMovieViewCell
           
           // Configure the cell with the data
            //dump(indexPath)
        let movie = self.favoriteMovies[indexPath.row]
           
           cell.setMovie(movie)
           // Return the cell
        
        if(indexPath.item < images.count) {
            cell.setImage(images[indexPath[1]])
        }
           return cell
    }
    

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            favoriteMovies.remove(at: indexPath.row)
            images = self.model.cacheImage(self.favoriteMovies)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(favoriteMovies), forKey:"favorites")
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        tableView.delegate = self
        tableView.dataSource = self
        self.getFavoriteMovies()
        images = self.model.cacheImage(self.favoriteMovies)
        //DispatchQueue.main.async{
            self.tableView.reloadData()
        //}

    }
    
    func getFavoriteMovies() {
        if let data = UserDefaults.standard.value(forKey:"favorites") as? Data {
            self.favoriteMovies = try! PropertyListDecoder().decode(Array<Movie>.self, from: data)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = tableView.indexPathForSelectedRow {
            let selectedMovie = favoriteMovies[index.row]
            let detailVC = segue.destination as! WebViewController
            detailVC.movie = selectedMovie
        } else {
            return
        }
        
        
        
    }
    
}
