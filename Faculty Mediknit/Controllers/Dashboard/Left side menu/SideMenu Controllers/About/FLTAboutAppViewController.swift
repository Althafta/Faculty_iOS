//
//  FLTAboutAppViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 12/12/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTAboutAppViewController: UIViewController {

    @IBOutlet weak var labelVersionNumber: UILabel!
    @IBOutlet weak var labelAboutApp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBarItem(isSidemenuEnabled: true)
        self.labelVersionNumber.text = "Version " + (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as AnyObject as! String)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "About"
    }
}
