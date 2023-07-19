//
//  CryptoCoinModel.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

struct CryptoCoinModel: Codable, Equatable, Hashable {
    let uuid: String
    let symbol: String
    let name: String
    let iconUrl: String
    let price: String
}
