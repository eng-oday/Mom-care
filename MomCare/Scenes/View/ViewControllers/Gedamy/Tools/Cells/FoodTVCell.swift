//
//  FoodTVCell.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class FoodTVCell: UITableViewCell {

        @IBOutlet weak var foodTitle: UILabel!
        @IBOutlet weak var imageFood: UIImageView!
        @IBOutlet weak var foodPeriod: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
    }
