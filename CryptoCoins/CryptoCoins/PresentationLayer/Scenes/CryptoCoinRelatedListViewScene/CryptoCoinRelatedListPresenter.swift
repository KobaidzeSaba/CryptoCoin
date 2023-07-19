//
//  CryptoCoinRelatedListPresenter.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation
import UIKit

@MainActor protocol CryptoCoinRelatedListPresentation: AnyObject {
    func presentCryptoCoinRelatedList(list: [CryptoCoinModel])
}

@MainActor final class CryptoCoinRelatedListPresenter: CryptoCoinRelatedListInteractorOutput {
    
    private weak var viewController: CryptoCoinRelatedListPresentation?
    
    func attach(viewController: CryptoCoinRelatedListPresentation) {
        self.viewController = viewController
    }
    
    nonisolated func finishedLoadCryptoCoinRelatedList(with list: [CryptoCoinModel]) {
        Task {
            await self.viewController?.presentCryptoCoinRelatedList(list: list)
        }
    }
}

