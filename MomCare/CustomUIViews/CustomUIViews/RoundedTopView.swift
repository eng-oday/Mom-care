//
//  RoundedTopView.swift
//  MomCare
//
//  Created by Eissa on 4/9/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit

 @IBDesignable
class RoundedTopView: UIView {

        @IBInspectable var cornerRadius: CGFloat {
            
            get{
                return layer.cornerRadius
            }
            set {
                layer.cornerRadius = newValue
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
                //layer.masksToBounds = newValue > 0
            }
        }
        
        @IBInspectable var borderWidth: CGFloat {
            get {
                return layer.borderWidth
            }
            set {
                layer.borderWidth = newValue
            }
        }
        
        @IBInspectable var borderColor: UIColor? {
            get {
                return UIColor(cgColor: layer.borderColor!)
            }
            set {
                layer.borderColor = borderColor?.cgColor
            }
        }
}

