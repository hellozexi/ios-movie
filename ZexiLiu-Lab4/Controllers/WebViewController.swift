//
//  WebViewController.swift
//  ZexiLiu-Lab4
//
//  Created by Mike Liu on 7/14/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController, WKNavigationDelegate {

    
    @IBOutlet weak var theWebView: WKWebView!
    @IBOutlet weak var theSpinner: UIActivityIndicatorView!
    var myURLRequest: URLRequest?
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        theWebView.navigationDelegate = self
        let baseURL:String = "https://m.youtube.com/results?q="
        let title:String = self.movie!.title
        let cleaned = title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let finalURL:String = baseURL + cleaned!
        let url = URL(string: finalURL)!
        let myURLRequest = URLRequest(url: url)
        theWebView.load(myURLRequest)
        theSpinner.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        theSpinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        theSpinner.stopAnimating()
        theSpinner.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
