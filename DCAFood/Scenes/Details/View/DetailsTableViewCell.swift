//
//  DetailsTableViewCell.swift
//  DCAFood
//
//  Created by jobzella on 03/03/2023.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    var delegate:ShowMoreHandler?
    @IBAction func showMoreDidTapped(){
        guard delegate != nil else{return}
        
        isShowMore = !isShowMore
        delegate?.showMoreTapped()
        
    }
    @IBOutlet weak var desc:UILabel!
    @IBOutlet weak var showMoreButton:UIButton!

    var isShowMore:Bool!=false{
        didSet{
            if isShowMore{
                desc.numberOfLines = 0
                showMoreButton.setTitle("show less", for: .normal)
            }
            else{
                desc.numberOfLines = 4
                showMoreButton.setTitle("show more", for: .normal)


            }
        }
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
