//
//  Request.swift
//  DCAFood
//
//  Created by jobzella on 04/03/2023.
//

import Foundation
class Request{
    class func request(method:Method,endpoint:Endpoints,completion:@escaping(_ data:Data?)->Void){
        var urlString:String!
        switch endpoint{
        case .gameDetails(let id):
            urlString = "https://api.rawg.io/api/games/\(id)&key=77fa1ef7ee904c22b4a1f4aea0fd0f1d"
        case .games( let page):
            urlString = "https://api.rawg.io/api/games?page_size=10&page=\(page)&key=77fa1ef7ee904c22b4a1f4aea0fd0f1d"
        case .gameSearch( let page,let key):
            urlString = "https://api.rawg.io/api/games?page_size=10&page=\(page)&search=\(key)&key=77fa1ef7ee904c22b4a1f4aea0fd0f1d"
        }
        guard let url = URL(string: urlString)else{return}
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {

                completion(data)

            } else if let error = error {
                print("HTTP Request Failed \(error)")
                completion(nil)
            }
        }

        task.resume()

    }

}
enum Endpoints{
    
    case games(page:Int)
    case gameDetails(id:Int)
    case gameSearch(page:Int,key:String)
}
enum Method:String{
    case GET
}
