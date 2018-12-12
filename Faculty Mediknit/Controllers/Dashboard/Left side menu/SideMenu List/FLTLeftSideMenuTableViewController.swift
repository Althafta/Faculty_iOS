//
//  FLTLeftSideMenuTableViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 28/09/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTLeftSideMenuTableViewController: UITableViewController {

    var arrayMenu = ["Home","Answer later","App settings","Contact help","About"]
    var arrayIdentifiers = ["DashboardTabVC","AnswerLaterTVC","AppSettingsTVC","ContactHelpVC","AboutAppVC"]
    
    var currentRow:Int = 0
    var currentSection = 0
    
    var lastSelectedRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayMenu.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeftSideMenuCell", for: indexPath)
        
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "NotoSans-Regular", size: 17.0)
        cell.textLabel?.text = self.arrayMenu[indexPath.row]
        if indexPath.row == currentRow {
            cell.backgroundColor = OFAUtils.getColorFromHexString("D3EEFD")
        }else{
            cell.backgroundColor = UIColor.white
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentRow = indexPath.row
        currentSection = indexPath.section
        
        lastSelectedRow=currentRow
        
        let identifier = self.arrayIdentifiers[indexPath.row]
        
        if indexPath.row == 4 || indexPath.row == 0 || indexPath.row == 3{
            let centerVC: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: identifier))!
            let centerNavVC = UINavigationController(rootViewController: centerVC)
            
            panel!.configs.bounceOnCenterPanelChange = true
            panel!.center(centerNavVC, afterThat: {
                print("Executing block after changing center panelVC From Left Menu")
            })
        }else{
            OFAUtils.showSnackbarWith(message: "Under development", actionTitle: "") {
                
            }
        }
        
        self.tableView .reloadRows(at: [IndexPath(row: currentRow, section: currentSection),IndexPath(row: lastSelectedRow, section: 0)], with:UITableView.RowAnimation.fade)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
