//
//  PregnancySupplementVC.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class PregnancySupplementVC: UIViewController {
        
        @IBOutlet weak var pregnancySupplementCollView: UICollectionView!
        @IBOutlet weak var nextBu: LocalizableButton!
        @IBOutlet weak var backBu: LocalizableButton!
        @IBOutlet weak var titleLbl: LocalizableLabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.backBu.set(image: UIImage(named: "arrow_point"), title: "", titlePosition: .right, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            self.titleLbl.text = self.titleName
            self.setupCollectionView()
        }
        
        let pregSupplementPres : PregnancySupplementPresenter? = nil
        var titleName = ""
        
        @IBAction func backBuTapped(_ sender: Any) {
            self.navigationController?.popViewController(animated: true)
        }
    }

