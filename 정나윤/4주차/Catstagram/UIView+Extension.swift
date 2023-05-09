//
//  UIView+Extension.swift
//  Catstagram
//
//  Created by 정나윤 on 2023/04/02.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {//모서리 따서 부드럽게
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
