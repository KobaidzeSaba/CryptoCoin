//
//  CryptoCoinListViewScene.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import UIKit

protocol CryptoCoinListViewScene {
    var viewController: UIViewController { get }
}

protocol CryptoCoinListViewSceneDelegate: AnyObject {
    func showCoinDetails(_ coin: CryptoCoinPresentationModel)
    func displayError(title: String, message: String, retryAction: (()->Void)?)
}

@MainActor protocol CryptoCoinListViewSceneFactoryProtocol {
    static func makeCryptoCoinListViewScene(_ dependencies: CryptoCoinPriceRepositoryDependencyContainer,
                                        delegate: CryptoCoinListViewSceneDelegate) -> CryptoCoinListViewScene
}

@MainActor final class CryptoCoinListViewSceneFactory: CryptoCoinListViewSceneFactoryProtocol {
    
    static func makeCryptoCoinListViewScene(_ repositoryDependencies: CryptoCoinPriceRepositoryDependencyContainer,
                                        delegate: CryptoCoinListViewSceneDelegate) -> CryptoCoinListViewScene {
        let presenter = CryptoCoinListPresenter()
        let interactor = CryptoCoinListInteractor(with: presenter, dependencies: repositoryDependencies)
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "list") as! CryptoCoinListViewController
        viewController.sceneDelegate = delegate
        viewController.interactor = interactor
        presenter.attach(viewController: viewController)
        return viewController
    }
    
}
