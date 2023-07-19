//
//  CryptoCoinPriceHistoryRepositoryProtocol.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

protocol CryptoCoinPriceHistoryRepositoryProtocol {
    func loadCryptoCoinPriceHistory(_ uuid: String) async throws -> CryptoCoinHistoryModel
}
