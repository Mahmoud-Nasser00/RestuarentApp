//
//  DataModel.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 24/03/2021.
//

import Foundation

class DataAccess {
    
    func getAllBurgerItems() -> [Item]{
        var items : [Item] = []
        items.append(Item(itemName: "Cheese Burger", itemCategory: "Burger", price: 10))
        items.append(Item(itemName: "Big Mac", itemCategory: "Burger", price: 20))
        items.append(Item(itemName: "Big Tasty", itemCategory: "Burger", price: 30))
        return items
    }
    
    func getAllPizzaItems() -> [Item]{
        var items : [Item] = []
        items.append(Item(itemName: "Margarita", itemCategory: "Pizza", price: 10))
        items.append(Item(itemName: "Vegetables", itemCategory: "Pizza", price: 20)) 
        return items
    }
    
    func getAllSaladItems() -> [Item]{
        return []
    }
}
