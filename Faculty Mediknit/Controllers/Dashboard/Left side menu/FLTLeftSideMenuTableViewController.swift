//
//  FLTLeftSideMenuTableViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 28/09/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTLeftSideMenuTableViewController: UITableViewController {

    var arrayMenu = ["Answer later","App settings","Contact help","About"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayMenu.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeftSideMenuCell", for: indexPath)

        cell.textLabel?.font = UIFont(name: "NotoSans-Regular", size: 17.0)
        cell.textLabel?.text = self.arrayMenu[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        OFAUtils.showSnackbarWith(message: "Sample snackbar", actionTitle: "Show") {
            OFAUtils.showToastWithTitle("Showing toast")
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
