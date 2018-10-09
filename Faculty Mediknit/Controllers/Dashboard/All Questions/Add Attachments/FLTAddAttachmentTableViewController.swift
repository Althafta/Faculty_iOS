//
//  FLTAddAttachmentTableViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 09/10/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTAddAttachmentTableViewController: UITableViewController,UITextViewDelegate {

    @IBOutlet weak var scrollViewImage: UIScrollView!
    @IBOutlet weak var imageViewAttachmentImage: UIImageView!
    @IBOutlet weak var textViewDescription: UITextView!
    @IBOutlet weak var buttonSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonSubmit.layer.cornerRadius = self.buttonSubmit.frame.height/2
        
        self.textViewDescription.layer.cornerRadius = 4
        self.textViewDescription.layer.borderWidth = 1.0
        self.textViewDescription.layer.borderColor = UIColor.gray.cgColor
        self.textViewDescription.inputAccessoryView = OFAUtils.getDoneToolBarButton(tableView: self, target: #selector(self.dismissKeyboard))
        
        self.scrollViewImage.delegate = self
        self.scrollViewImage.minimumZoomScale = 1.0
        self.scrollViewImage.maximumZoomScale = 5.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Post photo"
    }
    
    override func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageViewAttachmentImage
    }
    
    //MARK:- Button Action
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    @IBAction func submitImagePressed(_ sender: UIButton) {
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if self.textViewDescription.text == "Type here"{
            self.textViewDescription.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if OFAUtils.isWhiteSpace(self.textViewDescription.text!){
            self.textViewDescription.text = "Type here"
        }
    }
}
