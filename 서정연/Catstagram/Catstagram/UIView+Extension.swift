//
//  UIView+Extension.swift
//  Catstagram
//
//  Created by Seo Cindy on 2023/03/28.
//

import UIKit

extension UIView{
    // @IBInspectable : 인터페이스 빌더에 Inspectable을 인스펙터로 사용
    @IBInspectable var cornerRadius: CGFloat{
        get{
            return layer.cornerRadius // 해당하는 layer의 cornerRadius 수치 가져옴
        }
        set{
            layer.cornerRadius = newValue // newValue 입력 받고 해당 UIView에 넣어줄 것임
            layer.masksToBounds = newValue > 0
        }
    } // 모서리 따기 : 모따기
}
