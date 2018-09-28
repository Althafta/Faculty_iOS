//
//  FLTLeftSideMenuTableViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 28/09/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTLeftSideMenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        panel!.configs.leftPanelWidth = self.view.frame.width - self.view.frame.width/5
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeftSideMenuCell", for: indexPath)

        cell.textLabel?.text = "Option \(indexPath.row+1)"

        return cell
    }
}
