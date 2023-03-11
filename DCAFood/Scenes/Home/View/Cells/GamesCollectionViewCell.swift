//
//  GamesCollectionViewCell.swift
//  DCAFood
//
//  Created by jobzella on 09/03/2023.
//

import UIKit

class GamesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var gameImage:UIImageView!
    @IBOutlet weak var gameName:UILabel!
    @IBOutlet weak var metacritic:UILabel!
    @IBOutlet weak var gameType:UILabel!
    var viewModel:GamesViewModel!

    func configureWith(model:GameModel!,offlineModel:OfflineGame! = nil){
        var game:GameModel!
        if offlineModel != nil{
            
            game = GameModel(name: offlineModel.name, image: offlineModel.image, metacritic: offlineModel.metacritic.intValue, genres:  [GameGenre(name: offlineModel.genres)], id: offlineModel.id.intValue)
            ImageProcessor.processFrom(urlString: offlineModel.image, to: gameImage)
        }
        
        else{
            game = model
        }
        gameName.text = game.name ?? ""
        metacritic.text = "\(game.metacritic ?? 0)"
        if let generes = game.genres{
            gameType.text = viewModel.getGenresNamesFrom(genres: generes)
        }
        ImageProcessor.processFrom(urlString: game.image ?? "", to: gameImage)

    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
