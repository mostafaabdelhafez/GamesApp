//
//  Extensions.swift
//  DCAFood
//
//  Created by jobzella on 03/03/2023.
//

import UIKit
extension UIView{
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }

}
extension UILabel{
    func setLineHeight(lineHeight: CGFloat) {
        let text = self.text
        if let text = text {
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()

            style.lineSpacing = lineHeight
            attributeString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSMakeRange(0,text.count))
            self.attributedText = attributeString
        }
    }

}
