//
//  Extensions.swift
//  Piano
//
//  Created by Alex Lopez on 06/10/2018.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

@IBDesignable extension UIButton {
    @IBInspectable var borderwidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var conerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        set {
            guard let uiColor = newValue else {return}
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else {return nil}
            return UIColor(cgColor: color)
        }
    }
}

