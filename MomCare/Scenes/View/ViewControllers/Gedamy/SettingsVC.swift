//
//  SettingsVC.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 3/31/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var backBu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.backBu.set(image: UIImage(named: "right_arrow"), title: "", titlePosition: .right, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func backBuTapped(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
      //  self.dismissview()
        handlePushSegue(viewController: MoreVC.self)
    }
    
    @IBAction func changeLanguageBtn(_ sender: Any) {
//        handlePushSegue(viewController: ChangeLanguageVC.self)
        
    }
    
    
    
}
