//
//  CryptoCoinPriceHistoryRepository.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

final class CryptoCoinPriceHistoryRepository: CryptoCoinPriceHistoryRepositoryProtocol {
    
    private let cryptoCoinRemoteApi: CryptoCoinRankingRemoteAPIProtocol
    
    init(cryptoCoinRemoteApi: CryptoCoinRankingRemoteAPIProtocol) {
        self.cryptoCoinRemoteApi = cryptoCoinRemoteApi
    }
    
    func loadCryptoCoinPriceHistory(_ uuid: String) async throws -> CryptoCoinHistoryModel {
        return try await cryptoCoinRemoteApi.loadCryptoCoinPriceHistory(uuid)
    }
    
}
