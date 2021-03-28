//
//  Item.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 24/03/2021.
//

import Foundation

struct Item : Equatable{
    
    var itemName:String
    var itemCategory:String
    var price : Float
    var size: Size? = .large
    var isFavourite: Bool
    var count:Int? = 0
    var imageName:String? = nil
    
    var totalPrice : Float {
        return price * Float(count!)
    }
}

struct CartItem : Hashable{
    var itemName:String
    var itemCategory:String
    var price : Float
    var count:Int? = 0
    var imageName:String? = nil
    
    var totalPrice : Float {
        return price * Float(count!)
    }
}

enum Size {
    case large
    case medium
    case small
}
