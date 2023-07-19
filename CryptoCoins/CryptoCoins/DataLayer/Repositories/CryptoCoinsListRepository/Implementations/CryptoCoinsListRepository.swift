//
//  CryptoCoinsListRepository.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

final class CryptoCoinsListRepository: CryptoCoinsListRepositoryProtocol {
    
    
    private let cryptoCoinRemoteApi: CryptoCoinRankingRemoteAPIProtocol
    
    init(cryptoCoinRemoteApi: CryptoCoinRankingRemoteAPIProtocol) {
        self.cryptoCoinRemoteApi = cryptoCoinRemoteApi
    }
    
    func loadCryptoList() async throws -> [CryptoCoinModel] {
        return try await cryptoCoinRemoteApi.loadCryptoList()
    }
    
    func loadCryptoListPage(_ page: Int) async throws -> [CryptoCoinModel] {
        return try await cryptoCoinRemoteApi.loadCryptoListPage(page)
    }
    
}
