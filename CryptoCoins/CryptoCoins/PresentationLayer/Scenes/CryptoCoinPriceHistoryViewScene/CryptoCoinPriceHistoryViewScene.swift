//
//  CryptoCoinPriceHistoryViewScene.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation
import UIKit

protocol CryptoCoinPriceHistoryViewScene {
    var viewController: UIViewController { get }
}

protocol CryptoCoinPriceHistoryViewSceneDelegate: AnyObject {
    func displayError(title: String, message: String, retryAction: (()->Void)?)
}

@MainActor protocol CryptoCoinPriceHistoryViewSceneFactoryProtocol {
    static func makeCryptoCoinPriceHistoryViewScene(_ uuid: String, repositoryDependencies: CryptoCoinPriceRepositoryDependencyContainer) -> CryptoCoinPriceHistoryViewScene
}

@MainActor final class CryptoCoinPriceHistoryViewSceneFactory: CryptoCoinPriceHistoryViewSceneFactoryProtocol {
    
    
    
    static func makeCryptoCoinPriceHistoryViewScene(_ uuid: String, repositoryDependencies: CryptoCoinPriceRepositoryDependencyContainer) -> CryptoCoinPriceHistoryViewScene {
        let presenter = CryptoCoinPriceHistoryPresenter()
        let interactor = CryptoCoinPriceHistoryInteractor(with: presenter, dependencies: repositoryDependencies)
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "history") as! CryptoCoinPriceHistoryViewController
        viewController.coinUUID = uuid
        viewController.interactor = interactor
        viewController.dependencies = repositoryDependencies
        presenter.attach(viewController: viewController)
        return viewController
    }
    
}
