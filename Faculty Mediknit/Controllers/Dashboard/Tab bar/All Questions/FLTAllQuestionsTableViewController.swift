//
//  FLTAllQuestionsTableViewController.swift
//  Faculty Mediknit
//
//  Created by Syam PJ on 28/09/18.
//  Copyright © 2018 Syam PJ. All rights reserved.
//

import UIKit

class FLTAllQuestionsTableViewController: UITableViewController,popUpDelegate {

    @IBOutlet weak var buttonHeader: UIButton!
    @IBOutlet weak var imageViewHeader: UIImageView!
    @IBOutlet weak var segmentControlHeader: TabySegmentedControl!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet var sectionHeaderView: UIView!
    @IBOutlet weak var sortHeading: UILabel!
    @IBOutlet weak var buttonSort: UIButton!
    @IBOutlet var popUpView: FLTPopUpView!
    
    var arraySortList = ["Over due first","Newest first","Answer later first"]
    var arrayReportList = ["Spam","Incomplete","Incorrect topic","Others"]
    
    var blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
    var blurEffectView = UIVisualEffectView()
    var selectedOrderIndex = 0
    var selectedSegmentIndex = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.segmentControlHeader.initUI()
        self.segmentControlHeader.setTitle("Unanswered (20)", forSegmentAt: 0)
        self.segmentControlHeader.setTitle("Answered (119)", forSegmentAt: 1)
        
        self.buttonHeader.layer.cornerRadius = self.buttonHeader.frame.height/2
        self.buttonHeader.layer.borderWidth = 1.0
        self.buttonHeader.layer.borderColor = UIColor.white.cgColor
        
        self.sortHeading.text = self.arraySortList[0]
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "All Questions"
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.selectedSegmentIndex == 0{
            return 20
        }else{
            return 10
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllQuestionsCell", for: indexPath) as! FLTAllQuestionsTableViewCell
        cell.buttonOption.tag = indexPath.row
        if self.selectedSegmentIndex == 0{
            cell.customizeCellWithDetails(question: "Sample Question \(indexPath.row + 1)", name: "Sample name \(100 / (indexPath.row+1))", duration: "5 days ago")
        }else{
            cell.customizeCellWithDetails(question: "Sample Answer \(indexPath.row + 1)", name: "Sample name \(100 / (indexPath.row+1))", duration: "5 days ago")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionDetails = self.storyboard?.instantiateViewController(withIdentifier: "QuestionDetailsTVC") as! FLTQuestionDetailsTableViewController
        self.navigationController?.children[0].navigationItem.title = ""
        self.navigationController?.pushViewController(questionDetails, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.tableView.estimatedRowHeight = 154
        self.tableView.rowHeight = UITableView.automaticDimension
        return self.tableView.rowHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.sectionHeaderView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    //MARK:- Button Actions
    
    @IBAction func optionPressed(_ sender: UIButton) {
        let cell = self.tableView.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as! FLTAllQuestionsTableViewCell
        let optionAction = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let reportAction = UIAlertAction(title: "Report", style: .default) { (action) in
            self.popUpView.delegate = self
            self.popUpView.labelPopUpHeading.text = "Choose a reason for reporting"
            self.popUpView.arrayListItems = self.arrayReportList
            self.popUpView.selectedIndex = 0
            self.popUpView.type = "report"
            self.popUpView.tableViewList.reloadData()
            self.showPopUp()
            self.blur()
            self.animateIn()
        }
        let addToFAQAction = UIAlertAction(title: "Add to FAQ", style: .default) { (action) in
            OFAUtils.showSnackbarWith(message: "Added to FAQ", actionTitle: "Undo", action: {
                //undo add to FAQ
            })
        }
        let ignoreAction = UIAlertAction(title: "Ignore", style: .default) { (action) in
            OFAUtils.showSnackbarWith(message: "Question Ignored", actionTitle: "Undo", action: {
                //undo ignore
            })
        }
        let answerLaterAction = UIAlertAction(title: "Answer Later", style: .default) { (action) in
            OFAUtils.showSnackbarWith(message: "Added to answer later", actionTitle: "Undo", action: {
                //undo answer later
            })
        }
        let requestPeerAction = UIAlertAction(title: "Request a peer", style: .default) { (action) in
            
        }
       
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            optionAction.dismiss(animated: true, completion: nil)
        }
        if self.segmentControlHeader.selectedSegmentIndex == 0{
            optionAction.addAction(ignoreAction)
            optionAction.addAction(answerLaterAction)
            optionAction.addAction(requestPeerAction)
            optionAction.addAction(reportAction)
        }else{
            optionAction.addAction(reportAction)
            optionAction.addAction(addToFAQAction)
        }
        optionAction.addAction(cancelAction)
        
        optionAction.view.tintColor = OFAUtils.getColorFromHexString(barTintColor)
        
        self.present(optionAction, animated: true, completion: nil)
        
        if !OFAUtils.isiPhone(){
            let popOVer = optionAction.popoverPresentationController
            popOVer?.sourceRect = cell.buttonOption.bounds
            popOVer?.sourceView = cell.buttonOption
        }
    }
    
    @IBAction func sortActionPressed(_ sender: UIButton) {
        self.popUpView.delegate = self
        self.popUpView.labelPopUpHeading.text = self.segmentControlHeader.selectedSegmentIndex == 0 ? "Sort unanswered questions" : "Sort answered questions"
        self.popUpView.arrayListItems = self.arraySortList
        self.popUpView.selectedIndex = self.selectedOrderIndex
        self.popUpView.type = "sort"
        self.popUpView.tableViewList.reloadData()
        self.showPopUp()
        blur()
        animateIn()
    }
    
    @IBAction func cancelPopUpPressed(_ sender: UIButton) {
        removeBlur()
        animateOut()
    }
    
    @IBAction func segmentControlSelected(_ sender: TabySegmentedControl) {
        self.selectedSegmentIndex = sender.selectedSegmentIndex
        if selectedSegmentIndex == 0{
            self.arraySortList = ["Over due first","Newest first","Answer later first"]
            self.popUpView.selectedIndex = 0
            self.selectedOrderIndex = 0
            self.sortHeading.text = self.arraySortList[0]
            self.popUpView.tableViewList.reloadData()
            //Call API with new sort order
        }else{
            self.arraySortList = ["Newest first","Older first"]
            self.sortHeading.text = self.arraySortList[0]
            self.popUpView.selectedIndex = 0
            self.selectedOrderIndex = 0
            self.popUpView.tableViewList.reloadData()
            //Call API with new sort order
        }
        
        self.tableView.reloadData()
    }
    
    //MARK:- PopUp Delegate
    
    func getSelectedItems(item: String, index: Int, type: String) {
        if type == "sort"{
            ////Call API with new sort order
            self.sortHeading.text = item
            self.selectedOrderIndex = index
        }else if type == "report"{
            
        }
        removeBlur()
        animateOut()
    }
    
    //MARK:- iPopUp Helpers
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        OFAUtils.lockOrientation(.portrait)
        popUpView.setNeedsFocusUpdate()
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let rootView = delegate.window?.rootViewController?.view
        
        popUpView.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: (rootView?.frame.width)! - 20, height: 300))//(rootView?.frame.height)!-((rootView?.frame.height)!/4)
        popUpView.center = view.center
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches , with:event)
        if touches.first != nil{
            removeBlur()
            animateOut()
        }
    }
    
    @objc func touchesView(){//tapAction
        removeBlur()
        animateOut()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        OFAUtils.lockOrientation(.portrait)
        removeBlur()
        animateOut()
        self.tableView.reloadData()
    }
    
    public func removeBlur() {
        blurEffectView.removeFromSuperview()
    }
    
    func showPopUp(){
        if !OFAUtils.isiPhone(){
            popUpView.frame.origin.x = 0
            popUpView.frame.origin.y = 0
        }
        else{
            let delegate = UIApplication.shared.delegate as! AppDelegate
            let rootView = delegate.window?.rootViewController?.view
            popUpView.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: (rootView?.frame.width)! - 20, height: 300))
        }
        popUpView.layer.cornerRadius = 5
    }
    
    func blur(){
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let rootView = delegate.window?.rootViewController?.view
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = (rootView?.bounds)!
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        rootView?.addSubview(blurEffectView)
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(self.touchesView))
        singleTap.numberOfTapsRequired = 1
        self.blurEffectView.addGestureRecognizer(singleTap)
    }
    
    func animateIn() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let rootView = delegate.window?.rootViewController?.view
        //        self.view.addSubview(popUpView)
        rootView?.addSubview(popUpView)
        popUpView.center = (rootView?.center)!
        popUpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popUpView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.popUpView.alpha = 1
            self.popUpView.transform = CGAffineTransform.identity
        }
    }
    
    public func animateOut () {
        UIView.animate(withDuration: 0.3, animations: {
            self.popUpView.transform = CGAffineTransform.init(scaleX: 2.0, y: 2.0)
            self.popUpView.alpha = 0
        }) { (success:Bool) in
            self.popUpView.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            self.popUpView.removeFromSuperview()
        }
    }
}
