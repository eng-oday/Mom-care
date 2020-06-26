//
//  PregenantNutritionVC.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class PregenantNutritionVC: UIViewController {

        @IBOutlet weak var pregnantNutritionLbl: UILabel!
        @IBOutlet weak var pregnantNutritionCollView: UICollectionView!
        @IBOutlet weak var backBu: UIButton!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationController?.navigationBar.isHidden = true
            self.backBu.set(image: UIImage(named: "arrow_point"), title: "", titlePosition: .right, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
            setupCollectionView()
            self.pregnantNutritionLbl.text = self.titleName
        }

        var titleName = ""
        var pregnantNutritionImages = ["plate","pan","extraWeight"]
        var pregnantNutritionNames = ["التغذيه المطلوبه","تناول الوصفات","وزن زائد"]
        
        @IBAction func backBuTapped(_ sender: UIButton) {
            let vc = ToolsVC(nibName: "ToolsVC", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
