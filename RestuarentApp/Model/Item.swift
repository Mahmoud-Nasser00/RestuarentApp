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
    var isFavourite: Bool
    var count:Int? = 0
    
    var totalPrice : Float {
        return price * Float(count!)
    }
}

