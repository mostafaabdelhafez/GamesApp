//
//  ImageProcessing.swift
//  DCAFood
//
//  Created by jobzella on 04/03/2023.
//

import UIKit
class ImageProcessor{
    class func processFrom(urlString:String,completion:@escaping(_ image:UIImage?)->Void){
        if let url = URL(string: urlString){
            
            let queue = DispatchQueue(label: "", qos: .background, attributes: .concurrent)
            queue.async {
                
                if let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async {
                        
                        completion(UIImage(data: data))
                    }
                }
            }
        }
    }
}
