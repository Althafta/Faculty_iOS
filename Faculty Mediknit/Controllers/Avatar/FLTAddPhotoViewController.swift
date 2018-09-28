//
//  FLTAddPhotoViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 27/09/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTAddPhotoViewController: UIViewController,avatarPickerDelegate {
   
    @IBOutlet weak var imageViewAvatar: UIImageView!
    @IBOutlet weak var buttonAddPhoto: UIButton!
    @IBOutlet weak var buttonAddLater: UIButton!
    
    @IBOutlet weak var buttonChangePhoto: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageViewAvatar.layer.cornerRadius = self.imageViewAvatar.frame.height/2
        self.buttonAddPhoto.layer.cornerRadius = self.buttonAddPhoto.frame.height/2
        
        self.buttonNext.layer.cornerRadius = self.buttonNext.frame.height/2
        self.buttonChangePhoto.isHidden = true
        self.buttonNext.isHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Add an Avatar"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.title = ""
    }
    
    //MARK:- Button Actions
    
    @IBAction func addPhotoPressed(_ sender: UIButton) {
        let avatarPreview = self.storyboard?.instantiateViewController(withIdentifier: "AvatarImagePreviewVC") as! FLTAvatarImagePreviewViewController
        avatarPreview.delegate = self
        self.navigationItem.title = ""
        self.navigationController?.pushViewController(avatarPreview, animated: true)
    }
    
    @IBAction func addLaterPressed(_ sender: UIButton) {
        let profileInfo = self.storyboard?.instantiateViewController(withIdentifier: "ProfileInfoTVC") as! FLTProfileInfoTableViewController
        self.navigationItem.title = ""
        self.navigationController?.pushViewController(profileInfo, animated: true)
    }
    
    @IBAction func changePhotoPressed(_ sender: Any) {
        let avatarPreview = self.storyboard?.instantiateViewController(withIdentifier: "AvatarImagePreviewVC") as! FLTAvatarImagePreviewViewController
        avatarPreview.delegate = self
        self.navigationItem.title = ""
        self.navigationController?.pushViewController(avatarPreview, animated: true)
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        let profileInfo = self.storyboard?.instantiateViewController(withIdentifier: "ProfileInfoTVC") as! FLTProfileInfoTableViewController
        self.navigationItem.title = ""
        self.navigationController?.pushViewController(profileInfo, animated: true)
    }
    
    //MARK:- Avatar Picker Delegate
    
    func getPickedImage(image: UIImage) {
        self.imageViewAvatar.layer.cornerRadius = self.imageViewAvatar.frame.height/2
        self.imageViewAvatar.contentMode = .scaleAspectFit
        self.imageViewAvatar.image = image
        self.buttonAddPhoto.isHidden = true
        self.buttonAddLater.isHidden = true
        
        self.buttonNext.layer.cornerRadius = self.buttonNext.frame.height/2
        self.buttonChangePhoto.isHidden = false
        self.buttonNext.isHidden = false
    }
    
}
