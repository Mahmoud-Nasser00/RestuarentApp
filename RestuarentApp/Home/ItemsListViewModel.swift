//
//  ItemsListViewModel.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 24/03/2021.
//

import Foundation


class ItemsListViewModel {
    
    private let dataAccess: DataAccess
    
    init(dataAccess:DataAccess) {
        self.dataAccess = dataAccess
    }
    
    func getBurgerItems()->[Item]{
        dataAccess.getAllBurgerItems()
    }
    
    func getPizzaItems()->[Item]{
        dataAccess.getAllBurgerItems()
    }
    
    func getSaladItems()->[Item]{
        dataAccess.getAllSaladItems()
    }
    
}
