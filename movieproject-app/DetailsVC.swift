//
//  DetailsVC.swift
//  movieproject-app
//
//  Created by Sagar Arora  on 6/10/16.
//  Copyright © 2016 Sagar Arora . All rights reserved.
//

import UIKit
import CoreData

class DetailsVC: UIViewController {
    
    @IBOutlet weak var MovieTitle: UILabel!
    @IBOutlet weak var fullMovieImg: UIImageView!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var IMDBLink: UIButton!
    
    var newMovie: Movie!
   

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        MovieTitle.text = newMovie.title
        fullMovieImg.image = newMovie.getMovieImg()
        movieDescription.text = newMovie.moviedescription
   
    
            
            
            
}
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToLink" {
        let IMDBController: IMDBVC = segue.destinationViewController as! IMDBVC
            // storing the reference to IMDBVC into that constant. it is casted as IMDBVC Controller Type so you can acess all the properties in the controller.
        IMDBController.linkWebsite = newMovie.movielink
       
    }
    }
    
    @IBAction func onLinkBtnPressed(sender: AnyObject) {
        performSegueWithIdentifier("goToLink", sender: nil)
        
        
    }
    
   


        // Do any additional setup after loading the view.




}
