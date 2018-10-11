//
//  FLTQuestionDetailsRepliesTableViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 09/10/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTQuestionDetailsRepliesTableViewController: UITableViewController,UITextViewDelegate,ImageOnlyDelegate,ImageAndTextDelegate {

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
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "repliesWithImageAndTextCell", for: indexPath) as! FLTReplyWithImageAndTextTableViewCell
            cell.buttonImage.tag = indexPath.row
            cell.buttonOption.tag = indexPath.row
            cell.delegate = self
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "repliesWithImageCell", for: indexPath) as! FLTReplyWithImageOnlyTableViewCell
            cell.buttonOption.tag = indexPath.row
            cell.buttonImage.tag = indexPath.row
            cell.delegate = self
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "repliesWithTextCell", for: indexPath) as! FLTReplyWithTextOnlyTableViewCell
            cell.buttonOption.tag = indexPath.row
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "repliesWithImageAndTextCell", for: indexPath) as! FLTReplyWithImageAndTextTableViewCell
            cell.buttonImage.tag = indexPath.row
            cell.buttonOption.tag = indexPath.row
            cell.delegate = self
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            self.tableView.estimatedRowHeight = 200
            self.tableView.rowHeight = UITableView.automaticDimension
            return self.tableView.rowHeight
        }else if indexPath.row == 1{
            self.tableView.estimatedRowHeight = 123
            self.tableView.rowHeight = UITableView.automaticDimension
            return self.tableView.rowHeight
        }else if indexPath.row == 2{
            self.tableView.estimatedRowHeight = 150
            self.tableView.rowHeight = UITableView.automaticDimension
            return self.tableView.rowHeight
        }else{
            self.tableView.estimatedRowHeight = 200
            self.tableView.rowHeight = UITableView.automaticDimension
            return self.tableView.rowHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return self.footerView
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    //MARK:- TextView Delegates
    @IBAction func attachmentPressed(_ sender: UIButton) {
        let addAttachment = self.storyboard?.instantiateViewController(withIdentifier: "AddAttachmentTVC") as! FLTAddAttachmentTableViewController
        self.navigationItem.title = ""
        self.navigationController?.pushViewController(addAttachment, animated: true)
    }
    
    @IBAction func postReplyPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func optionPressedForReply(_ sender: UIButton) {
        
    }
    
    //MARK:- UITextview Delegate
    
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
        self.tableView.scrollRectToVisible(self.footerView.frame, animated: true)
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        self.buttonPost.titleLabel?.textColor = OFAUtils.getColorFromHexString(buttonBackgroundColor)
        return true
    }
    
    //MARK:- Cell Delegates
    
    func getImageData(imageURL: String) {
        let imagePreview = self.storyboard?.instantiateViewController(withIdentifier: "AttachmentPreviewVC") as! FLTAttachmentPreviewViewController
        self.navigationItem.title = ""
        imagePreview.imageURLString = imageURL
        self.navigationController?.pushViewController(imagePreview, animated: true)
    }
    
    func getImageAndTextData(imageURL: String, caption: String) {
        let imagePreview = self.storyboard?.instantiateViewController(withIdentifier: "AttachmentPreviewVC") as! FLTAttachmentPreviewViewController
        self.navigationItem.title = ""
        imagePreview.imageURLString = imageURL
        self.navigationController?.pushViewController(imagePreview, animated: true)
    }
}
