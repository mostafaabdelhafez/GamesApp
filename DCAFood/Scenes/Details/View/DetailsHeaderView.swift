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
        
        DispatchQueue.main.async {
            ImageProcessor.processFrom(urlString: image, completion: {image in
                self.gameImage.image = image
                
            })
        }
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
