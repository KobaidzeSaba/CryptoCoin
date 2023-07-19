//
//  CryptoCoinPriceHistoryPresenter.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

import UIKit

@MainActor protocol CryptoCoinPriceHistoryPresentation: AnyObject {
    func presentCryptoCoinPriceHistory(with history: [CryptoCoinHistoryPresentationModel])
}

@MainActor final class CryptoCoinPriceHistoryPresenter: CryptoCoinPriceHistoryInteractorOutput {
    
    private weak var viewController: CryptoCoinPriceHistoryPresentation?
    
    func attach(viewController: CryptoCoinPriceHistoryPresentation) {
        self.viewController = viewController
    }
    
    nonisolated func finishedLoadCryptoCoinPriceHistory(with history: CryptoCoinHistoryModel) {
        let historyPrices = history.history.map { price in
            CryptoCoinHistoryPresentationModel(cryptoCoinHistoryPrice: price)
        }
        Task {
            await self.viewController?.presentCryptoCoinPriceHistory(with: historyPrices)
        }
    }
}

