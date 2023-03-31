//
//  UIView+Extension.swift
//  Catstagram
//
//  Created by Suyeon Hwang on 2023/03/27.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
