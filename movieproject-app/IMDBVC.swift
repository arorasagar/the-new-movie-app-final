//
//  IMDBVC.swift
//  movieproject-app
//
//  Created by Sagar Arora  on 6/11/16.
//  Copyright © 2016 Sagar Arora . All rights reserved.
//

import UIKit
import WebKit

class IMDBVC: UIViewController {
    
    var linkWebsite: String!


    @IBOutlet weak var linkView: UIView!
    var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        linkView.addSubview(webView)
         loadRequest(linkWebsite)
        
   // Constraints on bounds are not applied in viewDidLoad()
     
       
        
        
        

        // Do any additional setup after loading the view.
    
  }
    override func viewDidAppear(animated: Bool) {
        
        let frame = CGRectMake(0, 0, linkView.bounds.width, linkView.bounds.height)
        webView.frame = frame
        
        
       
        
    }
    
    
    func loadRequest(urlSite: String) {
        let newUrl = NSURL(string: urlSite)!
        let request = NSURLRequest(URL: newUrl)
        
            webView.loadRequest(request)
        
        
    }
    
 

}
