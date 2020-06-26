//
//  FoodRecipesVC.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class FoodRecipesVC: UIViewController {

        @IBOutlet weak var titleLbl: LocalizableLabel!
        @IBOutlet weak var backBu: LocalizableButton!
        @IBOutlet weak var foodRecipesTableView: UITableView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.backBu.set(image: UIImage(named: "arrow_point"), title: "", titlePosition: .right, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
            self.titleLbl.text = self.titleName
            self.setupTableView(tableView: foodRecipesTableView)
            
        }
        
        var titleName = ""

        @IBAction func backBuTapped(_ sender: LocalizableButton) {
            self.navigationController?.popViewController(animated: true)
        }
    }
