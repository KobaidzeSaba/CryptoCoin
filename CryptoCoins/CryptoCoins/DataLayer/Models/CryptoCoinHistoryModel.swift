//
//  CryptoCoinHistoryModel.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

struct CryptoCoinHistoryModel: Codable {
    let change: String
    let history: [CryptoCoinHistoryPriceModel]
}
