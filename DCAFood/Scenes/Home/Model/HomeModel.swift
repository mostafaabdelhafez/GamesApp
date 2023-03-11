//
//  Model.swift
//  DCAFood
//
//  Created by jobzella on 03/03/2023.
//

import UIKit
struct BaseModel:Codable{
    var results:[GameModel]?
    var count:Int?
    var next:String?
}
struct GameModel:Codable{
    var name:String?
    var image:String?
    var metacritic:Int?
    var genres:[GameGenre]?
    var id:Int?
    enum CodingKeys: String, CodingKey {
        case name, metacritic, id, genres
        case image = "background_image"
    }

}
struct GameWithImage{
    var game:GameModel
    var image:UIImage?
}

struct GameGenre:Codable{
    var name:String?
}
