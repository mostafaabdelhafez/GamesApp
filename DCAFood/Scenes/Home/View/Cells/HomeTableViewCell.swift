//
//  HomeTableViewCell.swift
//  DCAFood
//
//  Created by jobzella on 03/03/2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var gameImage:UIImageView!
    @IBOutlet weak var gameName:UILabel!
    @IBOutlet weak var metacritic:UILabel!
    @IBOutlet weak var gameType:UILabel!
    func configureWith(model:GameModel){
        gameName.text = model.name ?? ""
        metacritic.text = "\(model.metacritic ?? 0)"
        if let generes = model.genres{
            let names = generes.map { $0.name ?? "" }
            gameType.text = names.count > 1 ? names.joined(separator: ", ") : names.first ?? ""

        }

        guard gameImage.image == nil else{return}
        
        ImageProcessor.processFrom(urlString: model.image ?? "", completion: {image in
            self.gameImage.image = image

        })
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
