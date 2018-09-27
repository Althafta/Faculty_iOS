//
//  FLTLoginTableViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 27/09/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit
import UnderLineTextField

class FLTLoginTableViewController: UITableViewController,UITextFieldDelegate,UnderLineTextFieldDelegate {

    @IBOutlet weak var textEmail: UnderLineTextField!
    @IBOutlet weak var textAccessID: UnderLineTextField!
    @IBOutlet weak var buttonForgotPassword: UIButton!
    @IBOutlet weak var buttonSignIn: UIButton!
    @IBOutlet weak var buttonNewAccessID: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textEmail.validationType = .afterEdit
        
        OFAUtils.setBackgroundForTableView(tableView: self.tableView)
        self.buttonSignIn.layer.cornerRadius = self.buttonSignIn.frame.height/2
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent=true
        self.navigationController?.view.backgroundColor = OFAUtils.getColorFromHexString(barTintColor)
        self.navigationController?.navigationBar.tintColor = OFAUtils.getColorFromHexString(barTintColor)
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))
        singleTap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(singleTap)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 || indexPath.row == 3{
            return 80
        }else if indexPath.row == 0{
            return 134
        }else if indexPath.row == 5{
            return 60
        }else{
            return UITableView.automaticDimension
        }
    }
    
    //MARK:- Button Actions
    
    @objc func tapAction(){
        self.view.endEditing(true)
    }
    
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
        let forgotAccessID = self.storyboard?.instantiateViewController(withIdentifier: "ForgotAccessIDTVC") as! FLTForgotPasswordTableViewController
        self.navigationItem.title = ""
        self.navigationController?.pushViewController(forgotAccessID, animated: true)
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        if self.validateFields(){
            //call API
            print("Api called")
        }
    }
    
    @IBAction func createNewAccessIDPressed(_ sender: UIButton) {
        let createNewAccess = self.storyboard?.instantiateViewController(withIdentifier: "RegisterTVC") as! FLTRegisterTableViewController
        self.navigationItem.title = ""
        self.navigationController?.pushViewController(createNewAccess, animated: true)
    }
    
    func validateFields()->Bool{
        if !OFAUtils.checkEmailValidation(stringEmail: self.textEmail.text!) || OFAUtils.isWhiteSpace(self.textEmail.text!){
            do{
                try self.textEmail.validate()
            }catch{
                print("error occured while field validation email")
            }
            return false
        }else if OFAUtils.isWhiteSpace(self.textAccessID.text!){
            do{
                try self.textAccessID.validate()
            }catch{
                print("error occured while field validation access ID")
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
        case self.textAccessID:
            if OFAUtils.isWhiteSpace(self.textAccessID.text!){
                throw UnderLineTextFieldErrors.error(message: "Enter a valid Access ID")
            }
        default:
            print("Invalid")
        }
    }
}
