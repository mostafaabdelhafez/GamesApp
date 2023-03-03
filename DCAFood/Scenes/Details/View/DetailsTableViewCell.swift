//
//  DetailsTableViewCell.swift
//  DCAFood
//
//  Created by jobzella on 03/03/2023.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var desc:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
