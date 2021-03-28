//
//  OrderDetailViewModel.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 29/03/2021.
//

import Foundation

class OrderDetailViewModel {
    
    var orderedItem : OrderDetailItem

    init(item:Item) {
        self.orderedItem = OrderDetailItem(itemName: item.itemName, itemCategory: item.itemCategory, price: item.price, size: .large ,count: 0 ,imageName: item.imageName)
    }
    
    func changeItemSize(size:Size){
        orderedItem.size = size
    }
    
    func changeItemCount(count:Int){
        orderedItem.count = count
    }
    
}
