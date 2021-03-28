//
//  HomeViewModel.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 28/03/2021.
//

import Foundation

public class ItemsViewModel {
    private let dataAccess: DataAccess
    
    var favouriteItems = [Item]()
    
    var searchItems = [Item]()
    
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
    
    //TODO:- Fix adding and deleting item to wish List bug
    func addDeleteFavouriteItem( item:inout Item){

        let isItemExists = favouriteItems.contains {
            $0.itemName == item.itemName
        }
        
        if isItemExists {
            item.isFavourite = true
            favouriteItems.remove(object: item)
        } else {
            item.isFavourite = true
            favouriteItems.append(item)
        }
        
    }
    
    func Search(index:Int,searchedText:String){
        switch index {
        case 0:
            let items = getBurgerItems()
            searchItems = items.filter({ (item) -> Bool in
                item.itemName.localizedCaseInsensitiveContains(searchedText)
            })
        case 1:
            let items = getPizzaItems()
            searchItems = items.filter({ (item) -> Bool in
                item.itemName.localizedCaseInsensitiveContains(searchedText)
            })
        case 2:
            let items = getSaladItems()
            searchItems = items.filter({ (item) -> Bool in
                item.itemName.localizedCaseInsensitiveContains(searchedText)
            })
        default: break
        }
    }
    
}


