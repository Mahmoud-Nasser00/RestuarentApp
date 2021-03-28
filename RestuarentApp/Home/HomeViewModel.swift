//
//  HomeViewModel.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 28/03/2021.
//

import Foundation

public class HomeViewModel {
    private let dataAccess: DataAccess
    
    var favouriteItems = [Item]()
    
    init(dataAccess:DataAccess) {
        self.dataAccess = dataAccess
    }
    
    func getBurgerItems()->[Item]{
        dataAccess.getAllBurgerItems()
    }
    
    func getPizzaItems()->[Item]{
        dataAccess.getAllPizzaItems()
    }
    
    func getSaladItems()->[Item]{
        dataAccess.getAllSaladItems()
    }
    
    func addDeleteFavouriteItem( item:inout Item){
        
        let isItemExists = favouriteItems.contains {
            $0.itemName == item.itemName
        }
        
        if isItemExists {
            let index = favouriteItems.first {
                $0.itemName == $0.itemName
            }
            item.isFavourite = true
            favouriteItems.remove(object: item)
        } else {
            item.isFavourite = true
            favouriteItems.append(item)
        }
        
    }
}

extension Array where Element: Equatable {

  // Remove first collection element that is equal to the given `object`:
  mutating func remove(object: Element) {
      guard let index = firstIndex(of: object) else {return}
      remove(at: index)
  }

}
