//
//  ViewController.swift
//  movieproject-app
//
//  Created by Sagar Arora  on 6/10/16.
//  Copyright © 2016 Sagar Arora . All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var movieArray = [Movie]()
    
    @IBOutlet weak var movieTableView: UITableView!
    
    @IBOutlet weak var movieImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "star.png")
        self.navigationItem.titleView = UIImageView(image: image)
            
        movieTableView.delegate = self
        movieTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(animated: Bool) {
        fetchandSetResults()
        movieTableView.reloadData()
        // Reload Data runs through all the table view functions so that way the new cell that has been appended into the array
        // will be configured and set the all the properties' data equal to the labels accordingly.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func fetchandSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.movieArray = results as! [Movie]
            // The array is now equal to the array of the different objects created from the cells.
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    /* referencing the app delegate and storing it into a variable. We forced unwrapped because we know we will be
     able to reference it. We then reference the managedObjectcontext so we can store and acesss the data and let it go through persist coordinator to store it. Now that we are referencing the managedObjectContext we can now fetchRequest specific data entity. Now you are going to do a try and catch incase the fetch for the specific
     entity data fails. So if it was able to get results then we are going to store it into the movies array as an array with those specific types of properties.
     */
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // creating a new cell and referencing the identifer then casting it as MovieCell type so that way you can create
        // a MovieCell and access the configuration function.
        if let cell = movieTableView.dequeueReusableCellWithIdentifier("movieCell") as? MovieCell {
            let movieCellPost = movieArray[indexPath.row]
            cell.configureCell(movieCellPost)
            return cell
        } else {
            return MovieCell()
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let movie = movieArray[indexPath.row]
        performSegueWithIdentifier("detailsIdentifier", sender: movie)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailsIdentifier" {
            if let detailsVC = segue.destinationViewController as? DetailsVC {
                if let movie = sender as? Movie {
                    detailsVC.newMovie = movie
                }
                   
                
                
                // referencing the view controller then store the sender data into a variable and then setting the object created in the DetailsVC equal to that specific data. Once you reference the DestinationViewController you can acesss all the variables created in that VC so you can set data equal to it accordingly. So here we created a variable and stored it as a Movie Object type. Then we set the Object in the destination controller equal to this object. the sender is sending in the object at the right index reference so it will set the newMovie object equal to that object's data so you can then acess all the properties.
                    // It says let movie equal the sender data as an object type movie and then set the newMovie object created equal to that data. The sender referencing the sender in the performSegueWithIdentifier function. Which is already set the the right object based on the index. 
                
            }
        }
        
        
        
        
        
        
        
        
    }
}

