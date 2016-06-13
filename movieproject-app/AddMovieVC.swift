//
//  AddMovieVC.swift
//  movieproject-app
//
//  Created by Sagar Arora  on 6/10/16.
//  Copyright © 2016 Sagar Arora . All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieReview: UITextField!
    @IBOutlet weak var movieLink: UITextField!
    @IBOutlet weak var movieDescription: UITextField!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieButton: UIButton!
    @IBOutlet weak var addMovieButton: UIButton! 
    
    var imgPicker: UIImagePickerController!
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        movieImg.layer.cornerRadius = 5.0
        movieImg.clipsToBounds = true
        movieButton.layer.cornerRadius = 5.0
        movieButton.clipsToBounds = true
        addMovieButton.layer.cornerRadius = 5.0
        addMovieButton.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func addMovieButton(sender: AnyObject) {
        if let movietitle = movieTitle.text where movietitle != "",
            let desc = movieDescription.text where movietitle != "",
            let Review = movieReview.text where Review != "",
            let link = movieLink.text where link != "",
            let movieUI = movieImg.image where movieImg != nil {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
                
            movie.title = movietitle
            movie.moviedescription = desc
            movie.movielink = link
            movie.review = Review
            movie.setMovieImg(movieUI)
            
            context.insertObject(movie)
            
            // You are storing the different text fields data, then you reference the app delegate and then call the ManagedObjectContext variable, followed by that it will talk the database and reference the entity and then create a new object with that entity. Then store what is in the text fields into the properties of the created object. Then you will save that object.
            
            do {
                try context.save()
            } catch {
                print("Unable to Save Movie")
            }
            
           self.navigationController?.popViewControllerAnimated(true)
            
            
            
            
            }
        

        }
        
    
    @IBAction func onAddPictureButtonPressed(sender: UIButton!) {
        presentViewController(imgPicker, animated: true, completion: nil)
        
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
        movieButton.setTitle("", forState: .Normal)
    }
}


