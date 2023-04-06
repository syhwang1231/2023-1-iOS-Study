//
//  UIViewController+Extension.swift
//  Catstagram
//
//  Created by Seo Cindy on 2023/03/28.
//

import UIKit
extension UIViewController{
    // 어떤 버튼을, 텍스트를, 폰트를, 컬러를 어떻게 적용할지의 값을 인수로 받음
    // ... : 복수의 파라미터를 받기 위함
    // NSMutableAttributedString : 어떤 속성이 적용된 String의 형태로 Return한다
    
    func generateButtonAttribute(_ button: UIButton, texts: String..., fonts:UIFont..., colors:UIColor...) -> NSMutableAttributedString{
        
        // UIButton에 입력된 Text 가져온다
        guard let wholeText = button.titleLabel?.text else {fatalError("버튼에 텍스트가 없음")}
        
        //폰트들
        let customFonts: [UIFont] = fonts
        
        // 설정하고자 하는 String의 NSRanges
        let customTextsRanges = texts.indices.map { index in
            (wholeText as NSString).range(of: texts[index])
        }
        
        // 설정하고자 하는 색상들
        let customColors = colors
        
        // attribute 객체를 생성한다
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        // 텍스트에 맞는 설정을 추가한다
        texts.indices.forEach{ index in
            attributedString.addAttribute(.font, value: customFonts[index], range:customTextsRanges[index])
            attributedString.addAttribute(.foregroundColor, value: customColors[index], range:customTextsRanges[index])
            
        }
        return attributedString
        
    }
}
