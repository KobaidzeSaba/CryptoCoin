//
//  StubCryptoCoinPriceRepository.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

final class StubCryptoCoinPriceRepository: CryptoCoinPriceHistoryRepositoryProtocol {
    
        func loadCryptoCoinPriceHistory(_ uuid: String) async throws -> CryptoCoinHistoryModel {
            return CryptoCoinHistoryModel(change: "-0.1", history: [CryptoCoinHistoryPriceModel(price: "2.0", timestamp: 12.0)])
    }
    
}
