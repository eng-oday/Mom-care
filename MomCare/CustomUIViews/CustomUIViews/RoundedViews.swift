//
//  RoundedViews.swift
//  MomCare
//
//  Created by Eissa on 4/5/20.
//  Copyright © 2020 Eissa. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedView: UIView {

    @IBInspectable var cornerRaduis: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRaduis
//            self.layer.borderWidth = 2.0
//            self.layer.borderColor = borderColor
            self.layer.shadowRadius = 1.0
            self.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
    
//    @IBInspectable var borderColor: CGColor = #colorLiteral(red: 0.3993991017, green: 0.7978107929, blue: 0.7646084428, alpha: 1) {
//        didSet {
//            self.layer.borderColor = borderColor
//        }
//    }
    override func awakeFromNib() {
        self.layer.cornerRadius = cornerRaduis
//        self.layer.borderWidth = 2.0
//        self.layer.borderColor = borderColor
        self.layer.shadowRadius = 1.0
        self.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.layer.cornerRadius = cornerRaduis
//        self.layer.borderWidth = 2.0
//        self.layer.borderColor = borderColor
        self.layer.shadowRadius = 1.0
        self.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }

}


@IBDesignable
class RoundedCornerView: UIView {
    
    // if cornerRadius variable is set/changed, change the corner radius of the UIView
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.masksToBounds = cornerRadius > 0

        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}

