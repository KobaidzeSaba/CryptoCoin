//
//  CryptoCoinPriceRepositoryDependencyContainer.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

final class CryptoCoinPriceRepositoryDependencyContainer {
    let coinListRepository: CryptoCoinsListRepositoryProtocol
    let coinHistoryRepository: CryptoCoinPriceHistoryRepositoryProtocol
    
    init(coinListRepository: CryptoCoinsListRepositoryProtocol,
         coinHistoryRepository: CryptoCoinPriceHistoryRepositoryProtocol) {
        self.coinListRepository = coinListRepository
        self.coinHistoryRepository = coinHistoryRepository
    }
}

