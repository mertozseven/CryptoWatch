//
//  CoinResultsViewModel.swift
//  Crypto Watch
//
//  Created by Mert Ozseven on 6.05.2024.
//

import Foundation

struct CoinResultsViewModel {
    
    var coins: [Coin]?
    var coin: Coin?
    
    subscript(index: Int) -> Coin? {
        return coins?[index]
    }
    
}
