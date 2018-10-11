//
//  FLTReplyWithTextOnlyTableViewCell.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 11/10/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTReplyWithTextOnlyTableViewCell: UITableViewCell {

    @IBOutlet weak var textViewReply: UITextView!
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
