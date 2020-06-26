//
//  CheckVC.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class CheckVC: UIViewController {
    
    @IBOutlet weak var checkTableView: UITableView!
    @IBOutlet weak var selectedSementControl: UISegmentedControl!
    @IBOutlet weak var titleLbl: LocalizableLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.titleLbl.text = self.titleName
        self.setupTableView(tableView: self.checkTableView)
    }

    var selectedUnselectedImg = ["correct","ckorrect-4","correct","correct-4"]
    var selctedImg = ["correct","correct","correct","correct","correct"]
    var unSelctedImg = ["correct-4","correct-4","correct-4","correct-4","correct-4","correct-4"]
    var titleName = ""
    
                      
    @IBAction func allChechBuTapped(_ sender: Any) {
        self.checkTableView.reloadData()
    }
    
    @IBAction func backBuTapped(_ sender: UIButton) {
        let vc = ToolsVC(nibName: "ToolsVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
