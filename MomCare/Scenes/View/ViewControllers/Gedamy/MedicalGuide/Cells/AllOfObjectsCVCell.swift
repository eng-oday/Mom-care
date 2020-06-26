//
//  AllOfObjectsCVCell.swift
//  MomCare
//
//  Created by Ebrahim  Mo Gedamy on 4/12/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class AllOfObjectsCVCell: UICollectionViewCell {

    @IBOutlet weak var titleLbl: LocalizableLabel!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.image.layer.cornerRadius = 10.0
        self.image.alpha = 0.75
        
    }


}
