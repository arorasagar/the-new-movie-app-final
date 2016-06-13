//
//  Movie+CoreDataProperties.swift
//  movieproject-app
//
//  Created by Sagar Arora  on 6/10/16.
//  Copyright © 2016 Sagar Arora . All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var img: NSData?
    @NSManaged var moviedescription: String?
    @NSManaged var movielink: String?
    @NSManaged var title: String?
    @NSManaged var review: String?
    @NSManaged var moveimgbutton: NSData?

}
