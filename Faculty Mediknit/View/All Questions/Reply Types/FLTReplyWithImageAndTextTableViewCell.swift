//
//  FLTReplyWithImageAndTextTableViewCell.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 11/10/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

protocol ImageAndTextDelegate {
    func getImageAndTextData(imageURL:String,caption:String)//add image URL parameter
}

class FLTReplyWithImageAndTextTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonImage: UIButton!
    @IBOutlet weak var textViewDescription: UITextView!
    @IBOutlet weak var buttonOption: UIButton!
    
    var delegate:ImageAndTextDelegate!
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
        self.delegate.getImageAndTextData(imageURL: self.imageURLString, caption: "")
    }
    
}
