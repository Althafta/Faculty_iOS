//
//  FLTCheckEmailViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 27/09/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTCheckEmailViewController: UIViewController {

    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var buttonCheckEmail: UIButton!
    @IBOutlet weak var labelMessage: UILabel!
    
    var isResetAccess = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.buttonCheckEmail.layer.cornerRadius = self.buttonCheckEmail.frame.height/2
        self.imageViewIcon.layer.cornerRadius = self.imageViewIcon.frame.height/2
        self.imageViewIcon.dropShadow()
        self.labelMessage.text = self.isResetAccess ? "We've sent you an email with a link to reset your access ID" : "We've sent you an email with your access ID"
    }

    @IBAction func checkEmailPressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        if let url = URL(string: "message://") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
