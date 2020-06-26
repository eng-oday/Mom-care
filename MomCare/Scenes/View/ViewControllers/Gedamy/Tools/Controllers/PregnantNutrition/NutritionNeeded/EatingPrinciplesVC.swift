//
//  EatingPrinciplesVC.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class EatingPrinciplesVC: UIViewController {
        
        @IBOutlet weak var backBu: UIButton!
        @IBOutlet weak var saftyTableView: UITableView!
        @IBOutlet weak var contentView: UIView!
        @IBOutlet weak var saftySementControl: UISegmentedControl!
        @IBOutlet weak var titleLbl: LocalizableLabel!

        override func viewDidLoad() {
            super.viewDidLoad()

            self.backBu.set(image: UIImage(named: "arrow_point"), title: "", titlePosition: .right, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            self.titleLbl.text = self.titleName
            self.setupTableView(tableView: self.saftyTableView)
        }
        
        var titleName = ""
        var safeImgArr = ["correct-1","correct-1","correct-1","correct-1"]
        var unsafeImgArr = ["unsafe","unsafe","unsafe","unsafe"]
        var unsafeFoodArr = ["الجبن الطري ","الطعام المعلب ","البابايا","الأناناس"]
        var safeFoodArr = ["البيض","السلامون","البقوليات","البطاطا الحلوه"]
        
        
        @IBAction func allChechBuTapped(_ sender: UISegmentedControl) {
            //self.contentView.bringSubviewToFront(safeView)
            self.saftyTableView.reloadData()
        }
        
        @IBAction func backBuTapped(_ sender: Any) {
            self.navigationController?.popViewController(animated: true)
        }

        
    }
