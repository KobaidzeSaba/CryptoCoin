//
//  CryptoCoinPriceSceneDependencyContainer.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

class CryptoCoinPriceSceneDependencyContainer {
    var cryptoCoinListSceneFactory: CryptoCoinListViewSceneFactoryProtocol.Type
    var cryptoCoinDetailsSceneFactory: CryptoCoinDetailsViewSceneFactoryProtocol.Type
    var cryptoCoinRelatedCoinsSceneFactory: CryptoCoinRelatedListViewSceneFactoryProtocol.Type

    
    init(cryptoCoinListSceneFactory: CryptoCoinListViewSceneFactoryProtocol.Type,
         cryptoCoinDetailsSceneFactory: CryptoCoinDetailsViewSceneFactoryProtocol.Type,
         cryptoCoinRelatedCoinsSceneFactory: CryptoCoinRelatedListViewSceneFactoryProtocol.Type) {
        self.cryptoCoinListSceneFactory = cryptoCoinListSceneFactory
        self.cryptoCoinDetailsSceneFactory = cryptoCoinDetailsSceneFactory
        self.cryptoCoinRelatedCoinsSceneFactory = cryptoCoinRelatedCoinsSceneFactory
    }
}
