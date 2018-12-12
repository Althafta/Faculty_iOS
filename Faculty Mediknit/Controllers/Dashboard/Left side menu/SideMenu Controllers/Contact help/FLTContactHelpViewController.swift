//
//  FLTContactHelpViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 12/12/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTContactHelpViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var textViewDescription: UITextView!
    @IBOutlet weak var buttonSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItem(isSidemenuEnabled: true)
        self.buttonSubmit.layer.cornerRadius = self.buttonSubmit.frame.height/2
        self.textViewDescription.layer.cornerRadius = 10
        self.textViewDescription.layer.borderWidth = 1.0
        self.textViewDescription.layer.borderColor = UIColor.lightGray.cgColor
        
        self.textViewDescription.textColor = UIColor.lightGray
        self.textViewDescription.inputAccessoryView = OFAUtils.getDoneToolBarButton(controller: self, target: #selector(self.dismissKeyboard))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Contact help"
    }
    
    //MARK:- Button Actions
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    @IBAction func submitContactPressed(_ sender: UIButton) {
        
    }
    
    //MARK:- TextView Delegates
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if OFAUtils.isWhiteSpace(self.textViewDescription.text!){
            self.textViewDescription.text = "Please describe your problem"
            self.textViewDescription.textColor = UIColor.lightGray
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.textViewDescription.textColor = UIColor.black
        if self.textViewDescription.text == "Please describe your problem"{
            self.textViewDescription.text = ""
        }
    }
}
