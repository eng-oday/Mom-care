//
//  ArticlesVC.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 3/31/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class ArticlesVC: UIViewController {
    
    
    @IBOutlet weak var bottomContentView: UIView!
    @IBOutlet weak var backBu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bottomContentView.addShadow(location: .top, color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), opacity: 0.2, radius: 5.0)
        self.backBu.set(image: UIImage(named: "right_arrow"), title: "", titlePosition: .right, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        
        self.navigationController?.navigationBar.isHidden = true
    }
    @IBAction func backBuTapped(_ sender: UIButton) {
        
        let vc = TabBarController(nibName: "TabBarController", bundle: nil)
        vc.selectedIndex = 2
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func donebuTapped(_ sender: UIButton) {
        self.handleSelectedBu(sender, Selectedmage: "correct", unSelectedmage: "correct-3")
    }
    
}
