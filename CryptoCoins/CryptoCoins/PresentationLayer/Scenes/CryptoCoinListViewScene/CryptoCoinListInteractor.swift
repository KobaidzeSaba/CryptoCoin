//
//  CryptoCoinListInteractor.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation


protocol CryptoCoinListInteractorInput: AnyObject {
    func loadCryptoList()
    func loadCryptoListNextPage()
}

protocol CryptoCoinListInteractorOutput: AnyObject {
    func finishedLoadCryptoList(with result: [CryptoCoinModel])
    func finishedLoadCryptoListNextPage(with result: [CryptoCoinModel])
    // Error forwarding
}

final actor CryptoCoinListInteractor: CryptoCoinListInteractorInput {
    
    private let presenter: CryptoCoinListInteractorOutput
    private let dependencies: CryptoCoinPriceRepositoryDependencyContainer
    
    private var page = 1
    
    var cachedlist = [CryptoCoinModel]()
    
    init(with presenter: CryptoCoinListInteractorOutput, dependencies: CryptoCoinPriceRepositoryDependencyContainer) {
        self.presenter = presenter
        self.dependencies = dependencies
    }
    
    nonisolated func loadCryptoList() {
        Task {
            await getCryptoList()
        }
    }
    
   nonisolated func loadCryptoListNextPage() {
        Task {
            await getCryptoNextPage()
        }
    }

    private func getCryptoList() {
        let remoteAPI = dependencies.coinListRepository
        Task {
            guard let list = try? await remoteAPI.loadCryptoList() else {
                return
            }
            self.presenter.finishedLoadCryptoList(with: list)
        }
    }
    
    private func getCryptoNextPage() {
        let remoteAPI = dependencies.coinListRepository
        Task {
            guard let list = try? await remoteAPI.loadCryptoListPage(page) else {
                return
            }
            page = page + 1
            self.presenter.finishedLoadCryptoListNextPage(with: list)
        }
    }
    
}
