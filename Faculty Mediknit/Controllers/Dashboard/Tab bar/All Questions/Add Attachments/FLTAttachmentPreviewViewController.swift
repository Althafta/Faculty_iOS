//
//  FLTAttachmentPreviewViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 10/10/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTAttachmentPreviewViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollViewImage: UIScrollView!
    @IBOutlet weak var imageViewPreview: UIImageView!
    @IBOutlet weak var textViewDescription: UITextView!
    
    var imageURLString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageViewPreview.sd_setImage(with: URL(string: self.imageURLString), placeholderImage: UIImage(named: "Default Image"), options: .progressiveDownload)
        
        self.scrollViewImage.delegate = self
        self.scrollViewImage.minimumZoomScale = 1.0
        self.scrollViewImage.maximumZoomScale = 5.0
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent=true
        self.navigationController?.view.backgroundColor = UIColor.black//OFAUtils.getColorFromHexString(barTintColor)
        self.navigationController?.navigationBar.tintColor = UIColor.white//OFAUtils.getColorFromHexString(barTintColor)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "AppBG"), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.white//OFAUtils.getColorFromHexString(barTintColor)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]//OFAUtils.getColorFromHexString(barTintColor)]
        self.navigationController?.navigationBar.barTintColor = UIColor.white//OFAUtils.getColorFromHexString(barTintColor)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageViewPreview
    }
}
