//
//  Movie.swift
//  movieproject-app
//
//  Created by Sagar Arora  on 6/10/16.
//  Copyright © 2016 Sagar Arora . All rights reserved.
//

import Foundation
import CoreData
import UIKit



class Movie: NSManagedObject {
    
    
    
    func setMovieImg(image: UIImage) {
        let data = UIImagePNGRepresentation(image)
        self.img = data
        
        
    }
    
    func getMovieImg() -> UIImage {
        let image = UIImage(data: self.img!)!
        return image
        
        
    }

// Insert code here to add functionality to your managed object subclass

}
