//
//  CryptoCoinPresentationModel.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

struct CryptoCoinPresentationModel: Hashable {
    let cryptoCoin: CryptoCoinModel
    
    init(cryptoCoin: CryptoCoinModel) {
        self.cryptoCoin = cryptoCoin
    }
    
    var name: String {
        return cryptoCoin.name
    }
    
    var iconUrl: String {
        return cryptoCoin.iconUrl
    }
    
    var price: String {
        let doubleValue = (cryptoCoin.price as NSString).doubleValue
        return String(format: "%.2f", doubleValue)
    }

    
}
