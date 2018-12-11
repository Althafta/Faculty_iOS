//
//  FLTMyLectureTableViewCell.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 11/12/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTMyLectureTableViewCell: UITableViewCell {

    @IBOutlet weak var textViewLectureContent: UITextView!
    @IBOutlet weak var labelPublishDate: UILabel!
    @IBOutlet weak var labelPublisher: UILabel!
    @IBOutlet weak var buttonUnAnswered: UIButton!
    @IBOutlet weak var buttonAnswered: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func customizeCellWithDetails(lectureContent:String,publishedOn:String,publishedBy:String,unAnsweredCount:String,answeredCount:String){
        self.textViewLectureContent.text = lectureContent
        self.labelPublishDate.text = "Published on "+publishedOn
        self.labelPublisher.text = publishedBy
        self.buttonUnAnswered.setTitle("(\(unAnsweredCount))" + "   Unanswered", for: .normal)
        self.buttonAnswered.setTitle("(\(answeredCount))" + "   Answered", for: .normal)
    }
}
