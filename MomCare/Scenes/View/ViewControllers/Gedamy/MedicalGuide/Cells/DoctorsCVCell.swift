//
//  DoctorsCVCell.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/9/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class DoctorsCVCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var toLbl: LocalizableLabel!
    @IBOutlet weak var availableDayes: LocalizableLabel!
    @IBOutlet weak var to2Lbl: LocalizableLabel!
    @IBOutlet weak var drProfileImg: UIImageView!
    @IBOutlet weak var drName: UILabel!
    @IBOutlet weak var end: LocalizableLabel!
    @IBOutlet weak var otherDayes: LocalizableLabel!
    @IBOutlet weak var dailyFrom: LocalizableLabel!
    @IBOutlet weak var holidayes: LocalizableLabel!
    @IBOutlet weak var statr: LocalizableLabel!
    @IBOutlet weak var moNum: LocalizableLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.layer.cornerRadius = 10
    }

}
