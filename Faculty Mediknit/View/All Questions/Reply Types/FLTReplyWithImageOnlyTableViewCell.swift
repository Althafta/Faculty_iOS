//
//  FLTReplyWithImageOnlyTableViewCell.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 11/10/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

protocol ImageOnlyDelegate {
    func getImageData(imageURL:String)//add image URL parameter
}

class FLTReplyWithImageOnlyTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonImage: UIButton!
    @IBOutlet weak var buttonOption: UIButton!
    
    var delegate : ImageOnlyDelegate!
    var imageURLString = "https://images.pexels.com/photos/87469/rose-blossom-bloom-red-rose-87469.jpeg?cs=srgb&dl=bloom-blossom-flora-87469.jpg&fm=jpg"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func imageButtonPressed(_ sender: UIButton) {
        self.delegate.getImageData(imageURL: self.imageURLString)
    }
}
