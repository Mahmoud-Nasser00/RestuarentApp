//
//  CartTableViewCell.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 25/03/2021.
//

import UIKit

protocol CartActionsDelegate {
    func updateViews(quantity: Int,index:Int)
}

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!{
        didSet{
            itemImage.layer.cornerRadius = 10
            itemImage.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemCategory: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var quantityNum: UILabel!
    
    var cartActionDelegate:CartActionsDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

   
    @IBAction func plusBtnTapped(_ sender: UIButton) {
        let qty = Int(quantityNum.text!)!
        quantityNum.text = String(qty + 1)
    }
    
    @IBAction func minusBtnTapped(_ sender: UIButton) {
        let qty = Int(quantityNum.text!)!
        if qty > 0 {
            quantityNum.text = String(qty - 1)
        }
        if qty == 1 {
            
        }
        
    }
    
}