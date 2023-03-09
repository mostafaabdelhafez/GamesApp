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
    func pinEdgesToSuperviewBounds(topMargin: CGFloat = 0,leftMargin: CGFloat = 0,rightMargin: CGFloat = 0,bottomMargin: CGFloat = 0) {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `pinEdgesToSuperviewBounds()` to fix this.")
            return
        }

        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: topMargin).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -bottomMargin).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leftMargin).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -rightMargin).isActive = true

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
