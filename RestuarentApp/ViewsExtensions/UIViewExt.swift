//
// UIViewExt.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 23/03/2021.
//

import UIKit

extension UIView {
    func addingShadowAndCornerRadius() {
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 30
    }
}

