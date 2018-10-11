//
//  FLTAddAttachmentTableViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 09/10/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTAddAttachmentTableViewController: UITableViewController,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var scrollViewImage: UIScrollView!
    @IBOutlet weak var imageViewAttachmentImage: UIImageView!
    @IBOutlet weak var textViewDescription: UITextView!
    @IBOutlet weak var buttonSubmit: UIButton!
    
    var imagePicker = UIImagePickerController()
    var actionSheet = UIAlertController()
    
    var imageData:Data?
    
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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(self.showAddImageActionSheet))
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
    
    //MARK:- Image picker helpers
    
    @objc func showAddImageActionSheet(){
        self.imagePicker.delegate = self
        actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString("Camera", comment: ""), style: .default, handler: { (alert:UIAlertAction) -> Void in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) == false {
                let cameraAlert = UIAlertController ( title:  NSLocalizedString("Sorry", comment: ""), message: NSLocalizedString("Camera Unavailable", comment: ""), preferredStyle: UIAlertController.Style.alert)
                cameraAlert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: UIAlertAction.Style.cancel, handler: { (alert:UIAlertAction) -> Void in
                    self.dismiss(animated: true, completion: nil)
                }))
                self.present(cameraAlert, animated: true, completion: nil)
            }
            else {
                self.imagePicker.allowsEditing = true
                self.imagePicker.sourceType = .camera
                
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }))
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString("Photo Library", comment: ""), style: .default, handler: { (alert:UIAlertAction) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == false {
                let cameraAlert = UIAlertController ( title: NSLocalizedString("Sorry", comment: ""), message: NSLocalizedString("Gallery Unavailable", comment: ""), preferredStyle: UIAlertController.Style.alert)
                cameraAlert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: UIAlertAction.Style.cancel, handler: { (alert:UIAlertAction) -> Void in
                    self.dismiss(animated: true, completion: nil)
                }))
                self.present(cameraAlert, animated: true, completion: nil)
            }
            else {
                self.imagePicker.allowsEditing = true
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }))
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: { (alert:UIAlertAction) -> Void in
            self.view.endEditing(true)
        }))
        
        self.present(actionSheet, animated: true, completion: nil)
        
        if !OFAUtils.isiPhone(){
            let popOVer = actionSheet.popoverPresentationController
            popOVer?.barButtonItem = self.navigationItem.rightBarButtonItem
        }
    }
    
    //MARK:- Image Picker Delegates
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        
        let pickedImage = (info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage)] as? UIImage)!
        if let convertedData = pickedImage.jpeg(.lowest) {
            self.imageData = convertedData
            self.imageViewAttachmentImage.image = UIImage(data: self.imageData!)
            dismiss(animated: true, completion: nil)
        }
    }
}
