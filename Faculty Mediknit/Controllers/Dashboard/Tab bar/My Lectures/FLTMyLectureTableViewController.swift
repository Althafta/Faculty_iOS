//
//  FLTMyLectureTableViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 11/12/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTMyLectureTableViewController: UITableViewController,popUpDelegate {

    @IBOutlet var viewHeader: UIView!
    @IBOutlet weak var labelSortHeader: UILabel!
    @IBOutlet weak var buttonSort: UIButton!
    
    var selectedOrderIndex = 0
    lazy var allQuestionPage = self.storyboard?.instantiateViewController(withIdentifier: "AllQuestionsTVC") as! FLTAllQuestionsTableViewController
    var arraySortOrder = ["Newest first","Older first","with unanswered question first"]
    var arraySortTextToDisplay = ["New","Older","Unanswered"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelSortHeader.text = self.arraySortTextToDisplay[self.selectedOrderIndex]
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
    
    //MARK:- Button Actions
    
    @IBAction func sortPressed(_ sender: UIButton) {
        allQuestionPage.popUpView.arrayListItems = self.arraySortOrder
        allQuestionPage.popUpView.delegate = self
        allQuestionPage.popUpView.labelPopUpHeading.text = "Sort lectures"
        allQuestionPage.popUpView.selectedIndex = self.selectedOrderIndex
        allQuestionPage.popUpView.type = "sort"
        allQuestionPage.popUpView.tableViewList.reloadData()
        allQuestionPage.showPopUp()
        allQuestionPage.blur()
        allQuestionPage.animateIn()
    }
    
    //MARK:- Sort popup delegate
    
    func getSelectedItems(item: String, index: Int, type: String) {
        if type == "sort"{
            ////Call API with new sort order
            self.labelSortHeader.text = self.arraySortTextToDisplay[index]//item
            self.selectedOrderIndex = index
        }else if type == "report"{
            
        }
        allQuestionPage.removeBlur()
        allQuestionPage.animateOut()
    }
}
