//
//  HomeTableViewCell.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 23/03/2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView:UIImageView!
    @IBOutlet weak var favouriteView:UIView! {
        didSet {
            favouriteView.layer.cornerRadius = favouriteView.frame.height / 2
            favouriteView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var heartBtn: UIButton!{
        didSet{
            heartBtn.setImage(UIImage(systemName: "heart.fill"), for: .selected)
            heartBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    @IBOutlet weak var ItemName: UILabel!
    @IBOutlet weak var itemCategory: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func heartBtnTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
}
