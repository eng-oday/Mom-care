//
//  BabyNutritionVC.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class BabyNutritionVC: UIViewController {

        @IBOutlet weak var babyNutritionLbl: LocalizableLabel!
        @IBOutlet weak var backBu: LocalizableButton!
        @IBOutlet weak var babyNutrionCollView: UICollectionView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.navigationController?.navigationBar.isHidden = true
            self.backBu.set(image: UIImage(named: "arrow_point"), title: "", titlePosition: .right, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
            self.babyNutritionLbl.text = self.titleName
            self.setupCollectionView()
        }

        var titleName = ""
        var guideArr = ["دليل تغذيه الطفل", "الرضاعه الصناعيه", "الرضاعه الطبيعيه" ," هل نام طفلك بالقدر الكافي"]
        
        @IBAction func backBuTapped(_ sender: LocalizableButton) {
            let vc = ToolsVC(nibName: "ToolsVC", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
