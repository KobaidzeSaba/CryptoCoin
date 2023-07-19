//
//  CryptoCoinListPresenter.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

@MainActor protocol CryptoCoinListPresentation: AnyObject {
    func presentCryptoList(list: [CryptoCoinPresentationModel])
    func presentCryptoListNextPage(list: [CryptoCoinPresentationModel])
}

@MainActor final class CryptoCoinListPresenter: CryptoCoinListInteractorOutput {
    
    private weak var viewController: CryptoCoinListPresentation?
    
    func attach(viewController: CryptoCoinListPresentation) {
        self.viewController = viewController
    }
    
    nonisolated func finishedLoadCryptoList(with result: [CryptoCoinModel]) {
        let coins = result.map { coin in
            CryptoCoinPresentationModel(cryptoCoin: coin)
        }
        Task {
            await self.viewController?.presentCryptoList(list: coins)
        }
    }
    
    nonisolated func finishedLoadCryptoListNextPage(with result: [CryptoCoinModel]) {
        let coins = result.map { coin in
            CryptoCoinPresentationModel(cryptoCoin: coin)
        }
        Task {
            await self.viewController?.presentCryptoListNextPage(list: coins)
        }
    }
    
}

