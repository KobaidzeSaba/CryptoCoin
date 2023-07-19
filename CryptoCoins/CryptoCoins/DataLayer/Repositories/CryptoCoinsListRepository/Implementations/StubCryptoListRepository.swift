//
//  StubCryptoListRepository.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

final class StubCryptoListRepository: CryptoCoinsListRepositoryProtocol {
    
    func loadCryptoList() async throws -> [CryptoCoinModel] {
        return Array(repeating: CryptoCoinModel(uuid: "assas", symbol: "PNP", name: "Poni", iconUrl: "", price: "212313123.112"), count: 10)
    }

    func loadCryptoListPage(_ page: Int) async throws -> [CryptoCoinModel] {
        return Array(repeating: CryptoCoinModel(uuid: "a", symbol: "NP", name: "Poni", iconUrl: "", price: "212313123.112"), count: 10)

    }
    
}
