//
//  DetailsModel.swift
//  DCAFood
//
//  Created by jobzella on 04/03/2023.
//

import Foundation
struct DetailsModel:Codable{
    var name:String?
    var description:String?
    var website:String?
    var reddit:String?
    var image:String?
    var raw:String?
    enum CodingKeys: String, CodingKey {
        case name, description, website
        case image = "background_image"
        case reddit = "reddit_url"
        case raw = "description_raw"

    }

}
