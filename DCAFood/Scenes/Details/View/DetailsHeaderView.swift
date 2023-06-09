//
//  DetailsHeaderView.swift
//  DCAFood
//
//  Created by jobzella on 03/03/2023.
//

import UIKit

class DetailsHeaderView: UIView {
    @IBOutlet weak var gameImage:UIImageView!
    @IBOutlet weak var gameName:UILabel!

    func configure(name:String,image:String){
        gameName.text = name
        
        ImageProcessor.processFrom(urlString: image, to: gameImage)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
