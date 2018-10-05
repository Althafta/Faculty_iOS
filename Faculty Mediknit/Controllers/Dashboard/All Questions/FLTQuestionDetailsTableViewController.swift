//
//  FLTQuestionDetailsTableViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 01/10/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTQuestionDetailsTableViewController: UITableViewController {

    @IBOutlet weak var textViewQuestion: UITextView!
    @IBOutlet weak var buttonOption: UIButton!
    @IBOutlet weak var imageViewAuthor: UIImageView!
    @IBOutlet weak var labelAuthorName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    @IBOutlet weak var buttonShowDetails: UIButton!
    @IBOutlet weak var labelFromLectureStatic: UILabel!
    @IBOutlet weak var labelPublishedInStatic: UILabel!
    @IBOutlet weak var textViewFromLecture: UITextView!
    @IBOutlet weak var imageViewPublishedIn: UIImageView!
    @IBOutlet weak var labelDetailsDate: UILabel!
    @IBOutlet weak var imageViewCollpase: UIImageView!
    
    @IBOutlet weak var labelReplyStatus: UILabel!
    @IBOutlet weak var buttonReply: UIButton!
    
    var isCollpased = false
    var isReplied = false
    //MARK:- Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buttonShowDetails.isHidden=true
        self.imageViewAuthor.setImageWith("Sample name", color: OFAUtils.getRandomColor(), circular: true)
        self.buttonReply.layer.cornerRadius = self.buttonReply.frame.height/2
        self.labelReplyStatus.text = self.isReplied ? "Replied" : "Not yet replied"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Question Details"
    }
    
    //MARK:- TableView DataSource
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            self.tableView.estimatedRowHeight = 154
            self.tableView.rowHeight = UITableView.automaticDimension
            return self.tableView.rowHeight
        case 1:
            if self.isCollpased==true{
                return 43
            }else{
                self.tableView.estimatedRowHeight = 145
                self.tableView.rowHeight = UITableView.automaticDimension
                return self.tableView.rowHeight
            }
        case 2:
            self.tableView.estimatedRowHeight = 50
            self.tableView.rowHeight = UITableView.automaticDimension
            return self.tableView.rowHeight
        default:
            print("invalid")
            return 50
        }
    }
    
    //MARK:- Button Actions
    
    @IBAction func replyPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func collpaseAction(_ sender: UIButton) {
        self.isCollpased = !self.isCollpased
        self.buttonShowDetails.isHidden = !self.buttonShowDetails.isHidden
        self.textViewFromLecture.isHidden = !self.textViewFromLecture.isHidden
        self.labelFromLectureStatic.isHidden = !self.labelFromLectureStatic.isHidden
        self.labelPublishedInStatic.isHidden = !self.labelPublishedInStatic.isHidden
        self.imageViewPublishedIn.isHidden = !self.imageViewPublishedIn.isHidden
        self.tableView.reloadData()
    }
    
    @IBAction func showDetailsCollpasePressed(_ sender: UIButton) {
        self.isCollpased = !self.isCollpased
        self.buttonShowDetails.isHidden = !self.buttonShowDetails.isHidden
        self.textViewFromLecture.isHidden = !self.textViewFromLecture.isHidden
        self.labelFromLectureStatic.isHidden = !self.labelFromLectureStatic.isHidden
        self.labelPublishedInStatic.isHidden = !self.labelPublishedInStatic.isHidden
        self.imageViewPublishedIn.isHidden = !self.imageViewPublishedIn.isHidden
        self.tableView.reloadData()
    }
    
    @IBAction func optionPressed(_ sender: UIButton) {
        
    }
}
