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
