//
//  WorkDatesVC.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 3/30/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class WorkDatesVC: UIViewController {
    
    @IBOutlet weak var backBu: UIButton!
    @IBOutlet weak var changeTimeStackview: UIStackView!
    @IBOutlet weak var wendesDayBu: UIButton!
    @IBOutlet weak var thrusDayBu: UIButton!
    @IBOutlet weak var thuesDayBu: UIButton!
    @IBOutlet weak var monDayBu: UIButton!
    @IBOutlet weak var sunDayBu: UIButton!
    @IBOutlet weak var saturDayBu: UIButton!
    @IBOutlet weak var startTime: UITextField!
    @IBOutlet weak var endTime: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationController?.isNavigationBarHidden = true
        self.creatTimePickerView(textField: startTime)
        self.creatTimePickerView(textField: endTime)
        creatToolBar(text: endTime)
        creatToolBar(text: startTime)
        startTime.inputAccessoryView = toolBar
        endTime.inputAccessoryView = toolBar
        self.changeTimeStackview.isHidden = true
        backBu.set(image: UIImage(named: "next"), title: "رجوع", titlePosition: .left, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    }

    var toolBar = UIToolbar()
    var todayButton = UIBarButtonItem()
    
    
    @IBAction func backBuTapped(_ sender: Any) {
        self.dismissview()
    }
    
    
    @IBAction func selectAllTappedBu(_ sender: UIButton) {
        if sender.currentImage == UIImage(named: "uncheckbox50"){
            sender.setImage(UIImage(named: "checkbox50"), for: .normal)
            self.handleSelectAllButton(image: "checkbox50")
            self.changeTimeStackview.isHidden = false
        }else{
            sender.setImage(UIImage(named: "uncheckbox50"), for: .normal)
            self.handleSelectAllButton(image: "uncheckbox50")
            self.changeTimeStackview.isHidden = true
        }
    }
    
    @IBAction func saturDayTappedBu(_ sender: UIButton){
        self.handleSelectedBu(sender, Selectedmage: "checkbox50", unSelectedmage: "uncheckbox50")
    }
    
    @IBAction func sunDayTappedBu(_ sender: UIButton) {
        self.handleSelectedBu(sender, Selectedmage: "checkbox50", unSelectedmage: "uncheckbox50")
    }
    
    @IBAction func monDayTappedBu(_ sender: UIButton) {
        self.handleSelectedBu(sender, Selectedmage: "checkbox50", unSelectedmage: "uncheckbox50")
    }
    
    @IBAction func wendesDayTappedBu(_ sender: UIButton) {
        self.handleSelectedBu(sender, Selectedmage: "checkbox50", unSelectedmage: "uncheckbox50")
    }
    @IBAction func thuesDayTappedBu(_ sender: UIButton) {
        self.handleSelectedBu(sender, Selectedmage: "checkbox50", unSelectedmage: "uncheckbox50")
    }
    
    @IBAction func thrusDayTappedBu(_ sender: UIButton
    ) {
        self.handleSelectedBu(sender, Selectedmage: "checkbox50", unSelectedmage: "uncheckbox50")
    }
  
    @IBAction func changeTimeBuTapped(_ sender: UIButton) {
        self.handlePushSegue(viewController: SaveDrDetailsVC.self)
    }
}
