//
//  CryptoCoinHistoryPriceModel.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

struct CryptoCoinHistoryPriceModel: Codable, Equatable, Hashable {
    var price: String
    var timestamp: Double
}
