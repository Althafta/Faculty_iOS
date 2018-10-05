//
//  FLTQuestionDetailsRepliesTableViewCell.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 04/10/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTQuestionDetailsRepliesTableViewCell: UITableViewCell {

    @IBOutlet weak var textViewReplies: UITextView!
    @IBOutlet weak var buttonOption: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
