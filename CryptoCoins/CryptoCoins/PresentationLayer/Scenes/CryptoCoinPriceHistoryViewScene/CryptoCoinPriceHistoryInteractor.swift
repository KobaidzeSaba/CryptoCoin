//
//  CryptoCoinPriceHistoryInteractor.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

protocol CryptoCoinPriceHistoryInteractorInput: AnyObject {
    func loadCryptoCoinPriceHistory(_ uuid: String)
}

protocol CryptoCoinPriceHistoryInteractorOutput: AnyObject {
    func finishedLoadCryptoCoinPriceHistory(with history: CryptoCoinHistoryModel)
    // Error forwarding
}

final actor CryptoCoinPriceHistoryInteractor: CryptoCoinPriceHistoryInteractorInput {
    
    private let presenter: CryptoCoinPriceHistoryInteractorOutput
    private let dependencies: CryptoCoinPriceRepositoryDependencyContainer
    
    
    
    var cachedlist = [CryptoCoinModel]()
    
    init(with presenter: CryptoCoinPriceHistoryInteractorOutput, dependencies: CryptoCoinPriceRepositoryDependencyContainer) {
        self.presenter = presenter
        self.dependencies = dependencies
    }
    
    nonisolated func loadCryptoCoinPriceHistory(_ uuid: String) {
        Task {
            await getCryptoCoinPriceHistory(uuid)
        }
    }
    
    private func getCryptoCoinPriceHistory(_ uuid: String) {
        let remoteAPI = dependencies.coinHistoryRepository
        Task {
            guard let result = try? await remoteAPI.loadCryptoCoinPriceHistory(uuid) else {
                return
            }
            self.presenter.finishedLoadCryptoCoinPriceHistory(with: result)
        }
    }

}
