//
//  OrderDetailItem.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 29/03/2021.
//

import Foundation

struct OrderDetailItem :Equatable {
    
    var itemName:String
    var itemCategory:String
    var price : Float
    var size: Size? = .large
    var count:Int? = 0
    var imageName:String? = nil
    
    var totalPrice : Float {
        return price * Float(count!)
    }
    
}
