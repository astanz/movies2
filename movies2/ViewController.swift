//
//  ViewController.swift
//  movies2
//
//  Created by Admin on 11/15/15.
//  Copyright © 2015 Codezero Media. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()
    var valueToPass: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
    
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.movies = results as! [Movie]
        } catch let err as NSError {
            print("LOAD ERROR: \(err.description)")
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            let movie = movies[indexPath.row]
            cell.configureCell(movie)
            return cell
        } else {
            return MovieCell()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)")
        
        valueToPass = indexPath.row
        performSegueWithIdentifier("segueDetailRecord", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueDetailRecord") {
            
            // initialize new view controller and cast it as a view controller
            let viewController = segue.destinationViewController as! DetailVC
            viewController.passedValue = valueToPass
        }
    }

}

