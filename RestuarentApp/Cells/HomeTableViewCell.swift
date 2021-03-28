//
//  HomeTableViewCell.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 23/03/2021.
//

import UIKit

protocol homeTVCellDelegate {
    func heartBtnTapped(index:Int,isFavourite:Bool)
}

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
    @IBOutlet weak var ItemImage:UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemCategory: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    var cellDelegate : homeTVCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(item:Item, rowIndex:Int){
        itemName.text = item.itemName
        itemCategory.text = item.itemCategory
        itemPrice.text = "\(String(item.price))$"
        cardView.image = rowIndex % 2 != 0 ? UIImage(named: "Rectangle 2") : UIImage(named: "Rectangle 1")
        ItemImage.image = UIImage(named: item.imageName ?? "")
    }

    @IBAction func heartBtnTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        cellDelegate?.heartBtnTapped(index: sender.tag,isFavourite: sender.isSelected)
    }
    
}
