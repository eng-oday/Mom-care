//
//  BabySleepTVCell.swift
//  MomCare
//
//  Created by Eissa on 5/4/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class BabySleepTVCell: UITableViewCell {

        @IBOutlet weak var headerLbl: LocalizableLabel!
        @IBOutlet weak var totalSleepHours: LocalizableLabel!
        @IBOutlet weak var lightSleepHours: LocalizableLabel!
        @IBOutlet weak var nightSleepHours: LocalizableLabel!
        @IBOutlet weak var lightImage: UIImageView!
        @IBOutlet weak var nightImage: UIImageView!
        @IBOutlet weak var containerView: UIView!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            self.containerView.layer.borderColor = #colorLiteral(red: 0, green: 0.6397607923, blue: 0.7196351886, alpha: 0.8)
            self.containerView.layer.borderWidth = 2.0
            self.containerView.layer.cornerRadius = 5.0
            self.nightImage.layer.cornerRadius = 15.0
            self.lightImage.layer.cornerRadius = 15.0
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
    }
