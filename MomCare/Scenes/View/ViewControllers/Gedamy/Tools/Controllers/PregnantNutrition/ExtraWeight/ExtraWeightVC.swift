//
//  ExtraWeightVC.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class ExtraWeightVC: UIViewController {

        @IBOutlet weak var extraFoodLbl: LocalizableLabel!
        @IBOutlet weak var backBu: LocalizableButton!
        @IBOutlet weak var extraWeightTableView: UITableView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.backBu.set(image: UIImage(named: "arrow_point"), title: "", titlePosition: .right, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
            self.setupTableView(tableView: self.extraWeightTableView)
            self.extraFoodLbl.text = self.titleName
        }
        
        var titleName = ""
        var tipsArr = ["تناول فطور جيد ","تناول وجبات صغيره","تناولي قدر كافي من الخضروات والفواكه","الالتزام بمواعيد تناول الطعام"]
        var tipsImagesArr = ["healthy-food","healthy-food","healthy-food","healthy-food","healthy-food"]
        @IBAction func backBuTapped(_ sender: LocalizableButton) {
            self.navigationController?.popViewController(animated: true)
        }
        
    }
