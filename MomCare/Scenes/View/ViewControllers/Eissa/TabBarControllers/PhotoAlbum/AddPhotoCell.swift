//
//  AddPhotoCell.swift
//  MomCare
//
//  Created by Eissa on 4/26/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class AddPhotoCell: UICollectionViewCell {

    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var imageCell: UIImageView!
    
      var deleteAction: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func deleteBtn(_ sender: Any) {
        deleteAction?()
    }
    
}
