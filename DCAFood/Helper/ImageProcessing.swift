//
//  ImageProcessing.swift
//  DCAFood
//
//  Created by jobzella on 04/03/2023.
//

import UIKit
import Kingfisher
class ImageProcessor{
    class func processFrom(urlString:String,to image:UIImageView){
        image.kf.indicatorType = .activity
        if let url = URL(string: urlString){
            image.kf.setImage(with: url)
        }
    }
}
