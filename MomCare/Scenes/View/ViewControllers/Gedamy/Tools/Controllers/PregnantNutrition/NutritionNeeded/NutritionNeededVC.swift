//
//  NutritionNeededVC.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class NutritionNeededVC: UIViewController {

        @IBOutlet weak var nutritionNeededLbl: UILabel!
        @IBOutlet weak var nutritionNeededCollView: UICollectionView!
        @IBOutlet weak var backBu: UIButton!
    fileprivate let collectionCellId = "ArticlesCollectionCell"
    let collectionCell = UINib(nibName: "AdvicesHomeCell", bundle: nil)
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.backBu.set(image: UIImage(named: "arrow_point"), title: "", titlePosition: .right, additionalSpacing: 10, state: .normal, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
            nutritionNeededCollView.register(collectionCell, forCellWithReuseIdentifier: collectionCellId)
            setupCollectionView()
            self.nutritionNeededLbl.text = self.nutritionLbl
        }
        
        var nutritionLbl = ""
        
        @IBAction func backBuTapped(_ sender: Any) {
            self.navigationController?.popViewController(animated: true)
        }
    }
