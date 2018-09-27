//
//  FLTAddPhotoViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 27/09/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTAddPhotoViewController: UIViewController {

    @IBOutlet weak var imageViewAvatar: UIImageView!
    @IBOutlet weak var buttonAddPhoto: UIButton!
    @IBOutlet weak var buttonAddLater: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageViewAvatar.layer.cornerRadius = self.imageViewAvatar.frame.height/2
        self.buttonAddPhoto.layer.cornerRadius = self.buttonAddPhoto.frame.height/2
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
        self.navigationItem.title = ""
        self.navigationController?.pushViewController(avatarPreview, animated: true)
    }
    
    @IBAction func addLaterPressed(_ sender: UIButton) {
    }
}
