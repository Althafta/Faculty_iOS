//
//  FLTProfileInfoTableViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 28/09/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit
import UnderLineTextField
import DropDown

class FLTProfileInfoTableViewController: UITableViewController,UnderLineTextFieldDelegate {

    @IBOutlet weak var buttonSalutation: UIButton!
    @IBOutlet weak var buttonQualification: UIButton!
    @IBOutlet weak var buttonSpeciality: UIButton!
    @IBOutlet weak var textAffiliationOrInstitution: UnderLineTextField!
    @IBOutlet weak var textDesignation: UnderLineTextField!
    @IBOutlet weak var textCouncilNumber: UnderLineTextField!
    
    @IBOutlet weak var buttonDone: UIButton!
    
    let salutationDropDown = DropDown()
    var arraySalutation = ["Mr.","Ms.","Mrs"]
    
    let qualificationDropDown = DropDown()
    var arrayQualification = ["MS","M Phil.","Doctrate","MBBS"]
    
    let specialityDropDown = DropDown()
    var arraySpeciality = ["Audiologist","Cardiologist","Dentist","Ortho"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.buttonDone.layer.cornerRadius = self.buttonDone.frame.height/2
        
        self.salutationDropDown.anchorView = self.buttonSalutation
        self.salutationDropDown.bottomOffset = CGPoint(x: 0, y: self.buttonSalutation.bounds.height)
        self.salutationDropDown.dataSource = self.arraySalutation
        self.salutationDropDown.selectionAction = { [weak self] (index, item) in
            self?.buttonSalutation.setTitle(self?.arraySalutation[index], for: .normal)
        }
        
        self.qualificationDropDown.anchorView = self.buttonQualification
        self.qualificationDropDown.bottomOffset = CGPoint(x: 0, y: self.buttonQualification.bounds.height)
        self.qualificationDropDown.dataSource = self.arrayQualification
        self.qualificationDropDown.selectionAction = { [weak self] (index, item) in
            self?.buttonQualification.setTitle(self?.arrayQualification[index], for: .normal)
        }
        
        self.specialityDropDown.anchorView = self.buttonSpeciality
        self.specialityDropDown.bottomOffset = CGPoint(x: 0, y: self.buttonSpeciality.bounds.height)
        self.specialityDropDown.dataSource = self.arraySpeciality
        self.specialityDropDown.selectionAction = { [weak self] (index, item) in
            self?.buttonSpeciality.setTitle(self?.arraySpeciality[index], for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "You are almost there!"
    }
    
    //MARK:- Drop down helper
    
    func customizeDropDown(_ sender: AnyObject,dropDown:DropDown) {
            let appearance = dropDown
            appearance.cellHeight = 60
            appearance.backgroundColor = UIColor(white: 1, alpha: 1)
            appearance.selectionBackgroundColor = UIColor(red: 0.6494, green: 0.8155, blue: 1.0, alpha: 0.2)
            appearance.cornerRadius = 10
            appearance.shadowColor = UIColor(white: 0.6, alpha: 1)
            appearance.shadowOpacity = 0.9
            appearance.shadowRadius = 10
            appearance.animationduration = 0.25
            appearance.textColor = .darkGray
    }
    
    //MARK:- Button Actions
    
    @IBAction func salutationPressed(_ sender: UIButton) {
        self.customizeDropDown(self, dropDown: self.salutationDropDown)
        self.salutationDropDown.show()
    }
    
    @IBAction func qualificationPressed(_ sender: UIButton) {
        self.customizeDropDown(self, dropDown: self.qualificationDropDown)
        self.qualificationDropDown.show()
    }
    @IBAction func specialityPressed(_ sender: UIButton) {
        self.customizeDropDown(self, dropDown: self.specialityDropDown)
        self.specialityDropDown.show()
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        if validateFields(){
            let delegate = UIApplication.shared.delegate as! AppDelegate
            delegate.initializeDashboard()
        }
    }
    
    func validateFields()->Bool{
        if OFAUtils.isWhiteSpace(self.textAffiliationOrInstitution.text!){
            do{
                try self.textAffiliationOrInstitution.validate()
            }catch{
                print("error occured while field validation")
            }
            return false
        }else if OFAUtils.isWhiteSpace(self.textDesignation.text!){
            do{
                try self.textDesignation.validate()
            }catch{
                print("error occured while field validation")
            }
            return false
        }else if OFAUtils.isWhiteSpace(self.textCouncilNumber.text!){
            do{
                try self.textCouncilNumber.validate()
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
        case self.textAffiliationOrInstitution:
            if OFAUtils.isWhiteSpace(self.textAffiliationOrInstitution.text!){
                throw UnderLineTextFieldErrors.error(message: "Enter Affiliation/Institution")
            }
        case self.textDesignation:
            if OFAUtils.isWhiteSpace(self.textDesignation.text!){
                throw UnderLineTextFieldErrors.error(message: "Enter Designation")
            }
        case self.textCouncilNumber:
            if OFAUtils.isWhiteSpace(self.textCouncilNumber.text!){
                throw UnderLineTextFieldErrors.error(message: "Enter Council number")
            }
        default:
            print("Invalid")
        }
    }
}
