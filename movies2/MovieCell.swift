//
//  MovieCell.swift
//  movies2
//
//  Created by Admin on 11/15/15.
//  Copyright © 2015 Codezero Media. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescrip: UILabel!
    @IBOutlet weak var movieLink: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    func configureCell(movie: Movie) {
        print("config cell called, title=\(movie.title)")
        movieTitle.text = movie.title
        movieDescrip.text = movie.descrip
        movieLink.text = movie.link
        movieImg.image = movie.getMovieImage()
        movieImg.layer.cornerRadius = 4.0
        movieImg.clipsToBounds = true
        
        
    }

}
