//
//  FLTMyLectureTableViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 11/12/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTMyLectureTableViewController: UITableViewController {

    @IBOutlet var viewHeader: UIView!
    @IBOutlet weak var labelSortHeader: UILabel!
    @IBOutlet weak var buttonSort: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "My Lectures"
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyLectureCell", for: indexPath) as! FLTMyLectureTableViewCell
        cell.customizeCellWithDetails(lectureContent: "Sample Lecture content \(indexPath.row + 1)", publishedOn: OFAUtils.getStringFromDate(Date()), publishedBy: "Gemteleversity", unAnsweredCount: "15", answeredCount: "15")
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.tableView.estimatedRowHeight = 191
        self.tableView.rowHeight = UITableView.automaticDimension
        return self.tableView.rowHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.viewHeader
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 52
    }
    @IBAction func sortPressed(_ sender: UIButton) {
    }
}
