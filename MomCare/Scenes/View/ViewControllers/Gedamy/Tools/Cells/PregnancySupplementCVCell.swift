//
//  PregnancySupplementCVCell.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class PregnancySupplementCVCell: UICollectionViewCell {
    
        @IBOutlet weak var nutritionTitle: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        func displayName(name: String) {
            nutritionTitle.text = name
        }
        
    }
