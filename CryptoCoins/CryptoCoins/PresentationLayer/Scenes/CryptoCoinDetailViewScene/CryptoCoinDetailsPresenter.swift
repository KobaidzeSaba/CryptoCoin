//
//  CryptoCoinDetailsPresenter.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation
import UIKit

@MainActor protocol CryptoCoinDetailsPresentation: AnyObject {
    func presentCryptoCoinDetails(coin: CryptoCoinPresentationModel)
}

@MainActor final class CryptoCoinDetailsPresenter: CryptoCoinDetailsInteractorOutput {
    
    private weak var viewController: CryptoCoinDetailsPresentation?
    
    func attach(viewController: CryptoCoinDetailsPresentation) {
        self.viewController = viewController
    }
    
    nonisolated func finishedLoadCryptoCoinDetails(with result: CryptoCoinPresentationModel) {
        Task {
            await self.viewController?.presentCryptoCoinDetails(coin:result)
        }
    }
}

