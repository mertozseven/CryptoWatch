//
//  CoinLogic.swift
//  Crypto Watch
//
//  Created by Mert Ozseven on 3.05.2024.
//

import Foundation

final class CoinLogic: CoinLogicProtocol {

    static let shared: CoinLogic = {
        let instance = CoinLogic()
        return instance
    }()
    
    private init() {}
    
//    func getCoinData(completionHandler: @escaping (Result<CoinResults, any Error>) -> Void) {
//        WebService.shared.request(request: Router.topRanking, decodeType: CoinResults.self, completionHandler: completionHandler)
//    }
    
}
