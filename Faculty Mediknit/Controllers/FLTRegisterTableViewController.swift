//
//  FLTRegisterTableViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 27/09/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit
import UnderLineTextField

class FLTRegisterTableViewController: UITableViewController,UnderLineTextFieldDelegate {

    @IBOutlet weak var textFirstName: UnderLineTextField!
    @IBOutlet weak var textLastName: UnderLineTextField!
    @IBOutlet weak var textEmail: UnderLineTextField!
    @IBOutlet weak var textMobile: UnderLineTextField!
    @IBOutlet weak var buttonRequest: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.buttonRequest.layer.cornerRadius = self.buttonRequest.frame.height/2
        self.textMobile.inputAccessoryView = OFAUtils.getDoneToolBarButton(tableView: self, target: #selector(self.tapAction))
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))
        singleTap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(singleTap)
    }

    //MARK:- Button Actions
    
    @objc func tapAction(){
        self.view.endEditing(true)
    }
    
    @IBAction func RequestPressed(_ sender: UIButton) {
        if self.validateFields(){
            print("call API to Request Access ID")
            let resetPasswordConfirmation = self.storyboard?.instantiateViewController(withIdentifier: "CheckEmailVC") as! FLTCheckEmailViewController
            resetPasswordConfirmation.isResetAccess = false
            self.navigationItem.title = ""
            self.navigationController?.pushViewController(resetPasswordConfirmation, animated: true)
        }
    }
    
    func validateFields()->Bool{
        if OFAUtils.isWhiteSpace(self.textFirstName.text!){
            do{
                try self.textFirstName.validate()
            }catch{
                print("error occured while field validation")
            }
            return false
        }else if OFAUtils.isWhiteSpace(self.textLastName.text!){
            do{
                try self.textLastName.validate()
            }catch{
                print("error occured while field validation")
            }
            return false
        }else if !OFAUtils.checkEmailValidation(stringEmail: self.textEmail.text!) || OFAUtils.isWhiteSpace(self.textEmail.text!){
            do{
                try self.textEmail.validate()
            }catch{
                print("error occured while field validation email")
            }
            return false
        }else if OFAUtils.isWhiteSpace(self.textMobile.text!){
            do{
                try self.textMobile.validate()
            }catch{
                print("error occured while field validation")
            }
            return false
        }else{
            return true
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
                throw UnderLineTextFieldErrors.error(message: "Enter a valid email")
            }
        case self.textLastName:
            if OFAUtils.isWhiteSpace(self.textLastName.text!){
                throw UnderLineTextFieldErrors.error(message: "Enter last name")
            }
        case self.textFirstName:
            if OFAUtils.isWhiteSpace(self.textFirstName.text!){
                throw UnderLineTextFieldErrors.error(message: "Enter First name")
            }
        case self.textMobile:
            if OFAUtils.isWhiteSpace(self.textMobile.text!){
                throw UnderLineTextFieldErrors.error(message: "Enter Mobile number")
            }else if (self.textMobile.text! as NSString).length < 10{
                throw UnderLineTextFieldErrors.error(message: "Enter a valid Mobile number")
            }else if (self.textMobile.text! as NSString).length > 12{
                throw UnderLineTextFieldErrors.error(message: "Enter a valid Mobile number")
            }
        default:
            print("Invalid")
        }
    }
}
