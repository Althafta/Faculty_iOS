//
//  FLTRepliesDetailsListTableViewCell.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 04/10/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTRepliesDetailsListTableViewCell: UITableViewCell,UITableViewDelegate,UITableViewDataSource {

    var arrayReplies = NSMutableArray()
    
    @IBOutlet weak var tableViewReplies: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.tableViewReplies.delegate = self
        self.tableViewReplies.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepliesListCell", for: indexPath) as! FLTQuestionDetailsRepliesTableViewCell
        cell.buttonOption.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 195
        tableView.rowHeight = UITableView.automaticDimension
        return tableView.rowHeight
    }
    
    @IBAction func optionPressed(_ sender: UIButton) {
        print(sender.tag)
    }
}
