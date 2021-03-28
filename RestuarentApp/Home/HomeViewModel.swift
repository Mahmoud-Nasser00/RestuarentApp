//
//  HomeViewModel.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 28/03/2021.
//

import Foundation

public class HomeViewModel {
    private let dataAccess: DataAccess
    
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
}
