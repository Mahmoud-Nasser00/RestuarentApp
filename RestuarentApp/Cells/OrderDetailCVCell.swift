//
//  OrderDetailCVCell.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 28/03/2021.
//

import UIKit

class OrderDetailCVCell: UICollectionViewCell {

    @IBOutlet weak var imageView:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(with image:UIImage){
        imageView.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "OrderDetailCVCell", bundle: nil)
    }
}
