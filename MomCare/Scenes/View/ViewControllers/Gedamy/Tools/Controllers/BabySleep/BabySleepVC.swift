//
//  BabySleepVC.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class BabySleepVC: UIViewController {

        @IBOutlet weak var titleLbl: LocalizableLabel!
        @IBOutlet weak var backBu: LocalizableButton!
        @IBOutlet weak var babySleepTableView: UITableView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationController?.navigationBar.isHidden = true
            self.backBu.set(image: UIImage(named: "next"), title: "", titlePosition: .left, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
            self.titleLbl.text = self.titleName
            self.setupTableView(tableView: self.babySleepTableView)
        }
        
        var titleName = ""
        
        var childbirthArr = ["من الولادة إلي 3 أشهر","من 3 أشهر إلي 6 أشهر","من 6 أشهر إلي 9 أشهر","من 9 أشهر إلي 12  شهر"]
        
        @IBAction func backBuTapped(_ sender: LocalizableButton) {
            let vc = ToolsVC(nibName: "ToolsVC", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
