//
//  FLTQuestionDetailsRepliesTableViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 09/10/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTQuestionDetailsRepliesTableViewController: UITableViewController,UITextViewDelegate {

    @IBOutlet var footerView: UIView!
    @IBOutlet weak var textViewReply: UITextView!
    @IBOutlet weak var buttonPost: UIButton!
    @IBOutlet weak var buttonAttachment: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textViewReply.layer.cornerRadius = 4
        self.textViewReply.layer.borderWidth = 1.0
        self.textViewReply.layer.borderColor = OFAUtils.getColorFromHexString(barTintColor).cgColor
        self.textViewReply.inputAccessoryView = OFAUtils.getDoneToolBarButton(tableView: self, target: #selector(self.dismissKeyboard))
        self.buttonPost.titleLabel?.textColor = .black
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Your Replies"
    }
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create different cell classes and populate each with relevant data
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "repliesWithImageAndTextCell", for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = UITableView.automaticDimension
        return self.tableView.rowHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return self.footerView
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    //MARK:- TextView Delegates
    @IBAction func attachmentPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func postReplyPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func optionPressedForReply(_ sender: UIButton) {
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.tableView.scrollRectToVisible(self.footerView.frame, animated: true)
        if self.textViewReply.text == "Type your reply"{
            self.textViewReply.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if OFAUtils.isWhiteSpace(self.textViewReply.text!){
            self.textViewReply.text = "Type your reply"
        }
        self.buttonPost.titleLabel?.textColor = .black
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        self.buttonPost.titleLabel?.textColor = .blue
        return true
    }
}
