//
//  FavouriteTableViewCell.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 25/03/2021.
//

import UIKit

protocol FavouriteCellDelegate {
    func heartBtnTapped(index:Int)
}

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!{
        didSet {
            itemImage.layer.cornerRadius = 10
            itemImage.layer.masksToBounds = true
        }
    }
  
    @IBOutlet weak var heartBtn: UIButton!{
        didSet {
            heartBtn.layer.cornerRadius = heartBtn.frame.height / 2
            heartBtn.layer.masksToBounds = true
            heartBtn.setImage(UIImage(systemName: "heart.fill"), for: .selected)
            heartBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    var favCellDelegate : FavouriteCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(item:Item){
        itemName.text = item.itemName
        categoryName.text = item.itemCategory
        itemPrice.text = String(item.price)
        heartBtn.isSelected = item.isFavourite
    }
   
    
    @IBAction func heartBtnTapped(_ sender: UIButton) {
        favCellDelegate?.heartBtnTapped(index: sender.tag)
    }

}
