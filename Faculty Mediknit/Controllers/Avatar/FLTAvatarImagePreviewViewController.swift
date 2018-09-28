//
//  FLTAvatarImagePreviewViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 27/09/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

protocol avatarPickerDelegate {
    func getPickedImage(image:UIImage)
}

class FLTAvatarImagePreviewViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIScrollViewDelegate {

    @IBOutlet weak var imageViewAvatar: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    var imagePicker = UIImagePickerController()
    var actionSheet = UIAlertController()
    
    var imageData:Data?
    var delegate:avatarPickerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showActionSheet()
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(self.showActionSheet))
        singleTap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(singleTap)
        
        self.scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 5.0
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent=true
        self.navigationController?.view.backgroundColor = UIColor.black//OFAUtils.getColorFromHexString(barTintColor)
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent=true
        self.navigationController?.view.backgroundColor = OFAUtils.getColorFromHexString(barTintColor)
        self.navigationController?.navigationBar.tintColor = OFAUtils.getColorFromHexString(barTintColor)
    }
    
    @objc func showActionSheet(){
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
            self.imageViewAvatar.image = UIImage(data: self.imageData!)
            dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK:- Button Action

    @IBAction func doneButtonPressed(_ sender: UIButton) {
        self.delegate.getPickedImage(image: self.imageViewAvatar.image!)
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- ScrollView Delegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageViewAvatar
    }
}

extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ quality: JPEGQuality) -> Data? {
        return self.jpegData(compressionQuality: quality.rawValue)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}
