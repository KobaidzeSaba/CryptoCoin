//
//  CryptoCoinListInteractorTests.swift
//  CryptoCoinsTests
//
//  Created by Saba Kobaidze on 19.07.23.
//

import XCTest
@testable import CryptoCoins

final class CryptoCoinListInteractorTests: XCTestCase {

    var dependencies = CryptoCoinPriceRepositoryDependencyContainer(coinListRepository: StubCryptoListRepository(), coinHistoryRepository: StubCryptoCoinPriceRepository())
    var presenter: MockCryptoCoinListPresenter!
    var interactor: CryptoCoinListInteractor!
    
    override func setUpWithError() throws {
        presenter = MockCryptoCoinListPresenter()
        
        interactor = CryptoCoinListInteractor(with: presenter,
                                          dependencies:dependencies)
        
    }

    override func tearDownWithError() throws {
        
    }

    
    func testLoadListFirstPage() async throws {
        interactor.loadCryptoList()
        let list = try! await presenter.finishedCryptoCurrencyLoadFuture.value.get()
        let expectedList = try! await dependencies.coinListRepository.loadCryptoList()
        XCTAssertEqual(list, expectedList)
    }

}
