//
//  Box.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 28/03/2021.
//

import Foundation

extension Array where Element: Equatable {

  // Remove first collection element that is equal to the given `object`:
  mutating func remove(object: Element) {
      guard let index = firstIndex(of: object) else {return}
      remove(at: index)
  }

}

