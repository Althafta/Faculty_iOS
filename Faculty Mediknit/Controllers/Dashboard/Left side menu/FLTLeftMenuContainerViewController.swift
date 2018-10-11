//
//  FLTLeftMenuContainerViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 11/10/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTLeftMenuContainerViewController: UIViewController {

    @IBOutlet weak var buttonLogout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panel!.configs.leftPanelWidth = self.view.frame.width - self.view.frame.width/5
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        let logoutAlert = UIAlertController(title: "Are you sure you want to logout?", message: nil, preferredStyle: .alert)
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            logoutAlert.dismiss(animated: true, completion: nil)
        }))
        logoutAlert.addAction(UIAlertAction(title: "Logout", style: .destructive, handler: { (action) in
            let delegate = UIApplication.shared.delegate as! AppDelegate
            delegate.logout()
        }))
        self.present(logoutAlert, animated: true, completion: nil)
    }
}
