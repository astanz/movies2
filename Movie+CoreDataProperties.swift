//
//  Movie+CoreDataProperties.swift
//  movies2
//
//  Created by Admin on 11/15/15.
//  Copyright © 2015 Codezero Media. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var title: String?
    @NSManaged var descrip: String?
    @NSManaged var link: String?
    @NSManaged var image: NSData?

}
