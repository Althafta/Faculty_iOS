//
//  FLTAllQuestionsTableViewCell.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 28/09/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTAllQuestionsTableViewCell: UITableViewCell {

    @IBOutlet weak var textViewQuestion: UITextView!
    @IBOutlet weak var imageViewAuthor: UIImageView!
    @IBOutlet weak var labelAuthorName: UILabel!
    @IBOutlet weak var labelDuration: UILabel!
    @IBOutlet weak var buttonOption: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func customizeCellWithDetails(question:String,name:String,duration:String){
        self.textViewQuestion.text = question
        self.imageViewAuthor.setImageWith(name, color: OFAUtils.getRandomColor(), circular: true)
        self.labelAuthorName.text = name
        self.labelDuration.text = duration
    }
}
