//
//  Model.swift
//  DCAFood
//
//  Created by jobzella on 03/03/2023.
//

import Foundation
struct BaseModel:Codable{
    var results:[GameModel]
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
struct GameGenre:Codable{
    var name:String?
}
