//
//  FLTPopUpView.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 03/10/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

protocol popUpDelegate {
    func getSelectedItems(item:String,index:Int,type:String)
}

class FLTPopUpView: UIView,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var labelPopUpHeading: UILabel!
    @IBOutlet weak var tableViewList: UITableView!
    var arrayListItems = [String]()
    var delegate:popUpDelegate!
    var selectedIndex = Int()
    var type = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayListItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "popUpListCell", for: indexPath) as! FLTPopupHelperTableViewCell
        cell.buttonPopUpOption.setTitle(self.arrayListItems[indexPath.row], for: .normal)
        cell.buttonPopUpOption.tag = indexPath.row
        if selectedIndex == indexPath.row{
            cell.buttonPopUpOption.isSelected = true
        }else{
            cell.buttonPopUpOption.isSelected = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    @IBAction func buttonOptionPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.delegate.getSelectedItems(item: self.arrayListItems[sender.tag], index: sender.tag, type: self.type)
    }
}
