//
//  CryptoCoinHistoryPresentationModel.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

struct CryptoCoinHistoryPresentationModel: Hashable {
    let cryptoCoinHistoryPrice: CryptoCoinHistoryPriceModel
    
    init(cryptoCoinHistoryPrice: CryptoCoinHistoryPriceModel) {
        self.cryptoCoinHistoryPrice = cryptoCoinHistoryPrice
    }
    
    var price: String {
        let doubleValue = (cryptoCoinHistoryPrice.price as NSString).doubleValue
        return String(format: "%.2f", doubleValue)
    }

    var date: String {
        let date = Date(timeIntervalSince1970: cryptoCoinHistoryPrice.timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: date)
    }
    
}
