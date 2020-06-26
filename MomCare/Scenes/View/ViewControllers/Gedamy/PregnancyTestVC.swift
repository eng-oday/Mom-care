//
//  PregnancyTestVC.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 3/31/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class PregnancyTestVC: UIViewController {

    @IBOutlet weak var bottomContentView: UIView!
    @IBOutlet weak var backBu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bottomContentView.addShadow(location: .top, color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), opacity: 0.2, radius: 5.0)
        self.backBu.set(image: UIImage(named: "right_arrow"), title: "", titlePosition: .right, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))

        
    }
    @IBAction func backBuTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func doneBuTapped(_ sender: UIButton) {
        self.handleSelectedBu(sender, Selectedmage: "correct-1", unSelectedmage: "correct-4")
    }
    
}
