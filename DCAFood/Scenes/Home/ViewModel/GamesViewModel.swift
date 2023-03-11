//
//  GamesViewModel.swift
//  DCAFood
//
//  Created by jobzella on 11/03/2023.
//

import Foundation
class GamesViewModel{
    func getGenresNamesFrom(genres:[GameGenre])->String{
            let names = genres.map { $0.name ?? "" }
            return  names.count > 1 ? names.joined(separator: ", ") : names.first ?? ""
    }
    func isReachTheBottom(total:Int,index:Int)->Bool{
        index == total - 1
    }

}
