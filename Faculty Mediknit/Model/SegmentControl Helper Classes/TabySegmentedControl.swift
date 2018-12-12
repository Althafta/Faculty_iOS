//
//  TabySegmentedControl.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 11/12/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class TabySegmentedControl: UISegmentedControl {
    
//    func drawRect(){
//        super.drawRect()
//        initUI()
//    }
    
    func initUI(){
        setupBackground()
        setupFonts()
    }
    
    func setupBackground(){
        let backgroundImage = UIImage(named: "segmented_unselected_bg")?.withRenderingMode(.alwaysTemplate)
        let dividerImage = UIImage(named: "segmented_separator_bg")?.withRenderingMode(.alwaysTemplate)
        let backgroundImageSelected = UIImage(named: "segmented_selected_bg")?.withRenderingMode(.alwaysTemplate)
        self.tintColor = UIColor.yellow//OFAUtils.getColorFromHexString(ofabeeGreenColorCode)
        
        self.setBackgroundImage(backgroundImage, for: UIControl.State(), barMetrics: .default)
        self.setBackgroundImage(backgroundImageSelected, for: .highlighted, barMetrics: .default)
        self.setBackgroundImage(backgroundImageSelected, for: .selected, barMetrics: .default)
        
        self.setDividerImage(dividerImage, forLeftSegmentState: UIControl.State(), rightSegmentState: .selected, barMetrics: .default)
        self.setDividerImage(dividerImage, forLeftSegmentState: .selected, rightSegmentState: UIControl.State(), barMetrics: .default)
        self.setDividerImage(dividerImage, forLeftSegmentState: UIControl.State(), rightSegmentState: UIControl.State(), barMetrics: .default)
    }
    
    func setupFonts(){
        let font = UIFont.systemFont(ofSize: 16.0)
        
        
        let normalTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: font
        ]
        
        self.setTitleTextAttributes(normalTextAttributes, for: UIControl.State())
        self.setTitleTextAttributes(normalTextAttributes, for: .highlighted)
        self.setTitleTextAttributes(normalTextAttributes, for: .selected)
    }
    
}
