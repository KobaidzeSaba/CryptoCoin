//
//  CryptoCoinRelatedListInteractor.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

protocol CryptoCoinRelatedListInteractorInput: AnyObject {
    func loadCryptoCoinRelated()
}

protocol CryptoCoinRelatedListInteractorOutput: AnyObject {
    func finishedLoadCryptoCoinRelatedList(with list: [CryptoCoinModel])
    // Error forwarding
}

final actor CryptoCoinRelatedListInteractor: CryptoCoinRelatedListInteractorInput {
    
    private let presenter: CryptoCoinRelatedListInteractorOutput
    private let dependencies: CryptoCoinPriceRepositoryDependencyContainer
    
    
    
    var cachedlist = [CryptoCoinModel]()
    
    init(with presenter: CryptoCoinRelatedListInteractorOutput, dependencies: CryptoCoinPriceRepositoryDependencyContainer) {
        self.presenter = presenter
        self.dependencies = dependencies
    }
    
    nonisolated func loadCryptoCoinRelated() {
        Task {
            await getRelatedCryptoList()
        }
    }
    
    private func getRelatedCryptoList() {
        let remoteAPI = dependencies.coinListRepository
        Task {
            let list = try! await remoteAPI.loadCryptoList()
            self.presenter.finishedLoadCryptoCoinRelatedList(with: list)
        }
    }

}
