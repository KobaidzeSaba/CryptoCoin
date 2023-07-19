//
//  CryptoCoinDetailsInteractor.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

protocol CryptoCoinDetailsInteractorInput: AnyObject {
    func loadCryptoCoinDetails()
}

protocol CryptoCoinDetailsInteractorOutput: AnyObject {
    func finishedLoadCryptoCoinDetails(with result: CryptoCoinPresentationModel)
    // Error forwarding
}

final actor CryptoCoinDetailsInteractor: CryptoCoinDetailsInteractorInput {
    
    private let presenter: CryptoCoinDetailsInteractorOutput
    private let dependencies: CryptoCoinPriceRepositoryDependencyContainer
    
    private let coin: CryptoCoinPresentationModel
    
    
    var cachedlist = [CryptoCoinPresentationModel]()
    
    init(with coin: CryptoCoinPresentationModel, presenter: CryptoCoinDetailsInteractorOutput, dependencies: CryptoCoinPriceRepositoryDependencyContainer) {
        self.coin = coin
        self.presenter = presenter
        self.dependencies = dependencies
    }
    
    nonisolated func loadCryptoCoinDetails() {
        getCryptoCoinDetails()
    }
    
    nonisolated private func getCryptoCoinDetails() {
        self.presenter.finishedLoadCryptoCoinDetails(with: self.coin)
    }
    
}
