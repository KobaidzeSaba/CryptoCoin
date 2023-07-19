//
//  MockCryptoListPresenter.swift
//  CryptoCoinsTests
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation
import Combine

final class MockCryptoCoinListPresenter: CryptoCoinListInteractorOutput {
    
    
    
    typealias MockFuture<T> = Future<T, Never>
    typealias LoadCoinListResult = Result<[CryptoCoinModel], Error>
    
    var finishedCryptoCurrencyLoadFuture: MockFuture<LoadCoinListResult>!
    
    private var finishedCryptoCurrencyLoadPromise: MockFuture<LoadCoinListResult>.Promise!
    
    init() {
        finishedCryptoCurrencyLoadFuture = Future({ promise in
            self.finishedCryptoCurrencyLoadPromise = promise
        })
    }
    
    func finishedLoadCryptoList(with result: [CryptoCoinModel]) {
        finishedCryptoCurrencyLoadPromise(.success(LoadCoinListResult.success(result)))
    }

    func finishedLoadCryptoListNextPage(with result: [CryptoCoinModel]) {
    }
    
}
