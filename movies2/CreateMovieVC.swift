//
//  CreateMovieVC.swift
//  movies2
//
//  Created by Admin on 11/17/15.
//  Copyright © 2015 Codezero Media. All rights reserved.
//

import UIKit
import CoreData

class CreateMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieDescrip: UITextField!
    @IBOutlet weak var movieLink: UITextField!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var addMovieBtn: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        movieImg.layer.cornerRadius = 4.0
        movieImg.clipsToBounds = true
        
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)

        //set existing image to selected image
        movieImg.image = image
    }

    @IBAction func addImage(sender: AnyObject!) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createMovie(sender: AnyObject!) {
        if let title = movieTitle.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            movie.title = movieTitle.text
            movie.descrip = movieDescrip.text
            movie.link = movieLink.text
            //needs error handling
            movie.setMovieImage(movieImg.image!)
            
            context.insertObject(movie)
            
            do {
                try context.save()
                print("SAVED: T:\(movie.title), D:\(movie.descrip), L:\(movie.link)")
            } catch {
                print("ERR: Could not save movie")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}
