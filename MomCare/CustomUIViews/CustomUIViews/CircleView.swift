//
//  CostomViews.swift
//  MomCare
//
//  Created by Eissa on 3/28/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

class CircleView: UIView {

    override func awakeFromNib() {
        
        layer.cornerRadius = self.frame.size.height/2
        layer.masksToBounds = true
    }

    override func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
        self.layer.cornerRadius = self.frame.size.height/2
        self.clipsToBounds = true
    }
}
