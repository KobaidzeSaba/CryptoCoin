//
//  CryptoCoinsListRepositoryProtocol.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

protocol CryptoCoinsListRepositoryProtocol {
    func loadCryptoList() async throws -> [CryptoCoinModel]
    func loadCryptoListPage(_ page: Int) async throws -> [CryptoCoinModel]
}
