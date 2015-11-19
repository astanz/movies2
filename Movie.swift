//
//  Movie.swift
//  movies2
//
//  Created by Admin on 11/15/15.
//  Copyright © 2015 Codezero Media. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Movie: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    // setter and getter for img
    func setMovieImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getMovieImage() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }
    
    
    
}
