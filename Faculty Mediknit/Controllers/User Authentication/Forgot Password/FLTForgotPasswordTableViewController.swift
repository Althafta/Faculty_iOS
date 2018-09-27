//
//  FLTForgotPasswordTableViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 27/09/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit
import UnderLineTextField

class FLTForgotPasswordTableViewController: UITableViewController,UnderLineTextFieldDelegate {

    @IBOutlet weak var textEmail: UnderLineTextField!
    @IBOutlet weak var buttonReset: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.buttonReset.layer.cornerRadius = self.buttonReset.frame.height/2
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))
        singleTap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(singleTap)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    //MARK:- Button Actions
    
    @objc func tapAction(){
        self.view.endEditing(true)
    }
    
    @IBAction func resetAccessIDPressed(_ sender: UIButton) {
        if !OFAUtils.checkEmailValidation(stringEmail: self.textEmail.text!) || OFAUtils.isWhiteSpace(self.textEmail.text!){
            do{
                try self.textEmail.validate()
            }catch{
                print("error occured while field validation email")
            }
            return
        }else{
            print("call API to reset")
            let resetPasswordConfirmation = self.storyboard?.instantiateViewController(withIdentifier: "CheckEmailVC") as! FLTCheckEmailViewController
            resetPasswordConfirmation.isResetAccess = true
            self.navigationItem.title = ""
            self.navigationController?.pushViewController(resetPasswordConfirmation, animated: true)
        }
    }
    
    //MARK:- Textfield Delegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag+1
        let nextResponder = textField.superview?.superview?.superview?.viewWithTag(nextTag)
        if nextResponder != nil{
            nextResponder?.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        return false
    }
    
    func textFieldValidate(underLineTextField: UnderLineTextField) throws {
        switch underLineTextField {
        case self.textEmail:
            if !OFAUtils.checkEmailValidation(stringEmail: self.textEmail.text!){
                throw UnderLineTextFieldErrors.error(message: "Enter a valid email address")
            }
        default:
            print("Invalid")
        }
    }
    
}
