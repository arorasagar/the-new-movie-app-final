//
//  MovieCell.swift
//  movieproject-app
//
//  Created by Sagar Arora  on 6/10/16.
//  Copyright © 2016 Sagar Arora . All rights reserved.
//

import UIKit
import CoreData

class MovieCell: UITableViewCell {
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReview: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieLink: UILabel!
    
    
    
    
    
    
    override func awakeFromNib() {
        movieImg.layer.cornerRadius = movieImg.frame.size.width / 2
        movieImg.clipsToBounds = true
        movieImg.layer.borderWidth = 3.0
        movieImg.layer.borderColor = UIColor.whiteColor().CGColor
        super.awakeFromNib()
        // Initialization code
    }
    

    
    
    
    func configureCell(movie: Movie) {
        movieTitle.text = movie.title
        movieReview.text = movie.review
        movieImg.image = movie.getMovieImg()
        movieLink.text = movie.movielink
        
        
    }
    

}


        
        
        
   

    


