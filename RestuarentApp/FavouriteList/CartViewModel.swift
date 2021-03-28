//
//  CartViewModel.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 28/03/2021.
//

// this class is not used yet
// this class is not used yet
// this class is not used yet
// this class is not used yet
// this class is not used yet
//TODO:- Refactor Cart VC to use ViewModel
import Foundation

class CartViewModel {
    
    private var cartItems = [CartItem:Float]()
    
    var totalPriceForAllItems:Float = 0.0
    var shippingFees:Float = 10.00
    var totalPriceWithShippingFees:Float {
        return totalPriceForAllItems + shippingFees
    }
    
    init(item:OrderDetailItem){
        let cartItem = CartItem(itemName: item.itemName, itemCategory: item.itemCategory, price: item.price, count:item.count)
        let totalPriceForItem = cartItem.price * Float(cartItem.count!)
        cartItems[cartItem] = totalPriceForItem
    }
    
    func getTotalPriceForAllItems(cartItems:[CartItem:Float]){
        var totalPrice:Float = 0.0
        for (_,Value) in cartItems {
            totalPrice += Value
        }
        totalPriceForAllItems = totalPrice
    }
    
    func getPriceAfterAddingQty(cartItem:CartItem){
        
    }
    
    func getPriceAfterSubtractingQty(cartItem:CartItem){
        
    }
    
    
}
