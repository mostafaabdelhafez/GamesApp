//
//  EmptyStateLabel.swift
//  DCAFood
//
//  Created by jobzella on 09/03/2023.
//

import UIKit
class EmptyStateCreator{
    class func createWith(text:String,on superView:UIView)->UILabel{
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        superView.addSubview(label)
        label.pinEdgesToSuperviewBounds()
        return label
    }
}
