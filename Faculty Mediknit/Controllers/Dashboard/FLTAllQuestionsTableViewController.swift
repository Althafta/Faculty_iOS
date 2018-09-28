//
//  FLTAllQuestionsTableViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 28/09/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTAllQuestionsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllQuestionsCell", for: indexPath) as! FLTAllQuestionsTableViewCell

        cell.customizeCellWithDetails(question: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", name: "Sample name", duration: "5 days ago")

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.tableView.estimatedRowHeight = 154
        self.tableView.rowHeight = UITableView.automaticDimension
        return self.tableView.rowHeight
    }
}
