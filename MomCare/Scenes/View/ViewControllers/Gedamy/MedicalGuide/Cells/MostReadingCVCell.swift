//
//  MostReadingCVCell.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/10/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class MostReadingCVCell: UICollectionViewCell {

    @IBOutlet weak var lable: LocalizableLabel!
    @IBOutlet weak var imageProfile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageProfile.layer.cornerRadius = 10.0
    }

}
