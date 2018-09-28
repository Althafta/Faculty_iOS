//
//  FLTDashboardViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 28/09/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTDashboardViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBarItem(isSidemenuEnabled: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "All Questions"
    }
    
    
}
