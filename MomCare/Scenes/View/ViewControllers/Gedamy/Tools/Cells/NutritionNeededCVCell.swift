//
//  NutritionNeededCVCell.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class NutritionNeededCVCell: UICollectionViewCell, NutritionNeededCellView {
    
        @IBOutlet weak var nutritionInage: UIImageView!
        @IBOutlet weak var nutritionTitle: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        func displayName(name: String) {
            nutritionTitle.text = name
        }
        
        func displayImage(name: String) {
            nutritionInage.image = UIImage(named: name)
        }

    }
