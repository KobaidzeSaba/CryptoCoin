//
//  CryptoCoinDetailsViewScene.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation
import UIKit

protocol CryptoCoinDetailsViewScene {
    var viewController: UIViewController { get }
}

protocol CryptoCoinDetailsViewSceneDelegate: AnyObject {
    func displayError(title: String, message: String, retryAction: (()->Void)?)
}

@MainActor protocol CryptoCoinDetailsViewSceneFactoryProtocol {
    static func makeCryptoCoinDetailsViewScene(_ coin: CryptoCoinPresentationModel, repositoryDependencies: CryptoCoinPriceRepositoryDependencyContainer,
                                        delegate: CryptoCoinDetailsViewSceneDelegate) -> CryptoCoinDetailsViewScene
}

@MainActor final class CryptoCoinDetailsViewSceneFactory: CryptoCoinDetailsViewSceneFactoryProtocol {
    
    static func makeCryptoCoinDetailsViewScene(_ coin: CryptoCoinPresentationModel, repositoryDependencies: CryptoCoinPriceRepositoryDependencyContainer,
                                        delegate: CryptoCoinDetailsViewSceneDelegate) -> CryptoCoinDetailsViewScene {
        let presenter = CryptoCoinDetailsPresenter()
        let interactor = CryptoCoinDetailsInteractor(with: coin, presenter: presenter, dependencies: repositoryDependencies)
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as! CryptoCoinDetailsViewController
        viewController.cryptoCoin = coin.cryptoCoin
        viewController.sceneDelegate = delegate
        viewController.repositoryDependencies = repositoryDependencies
        viewController.interactor = interactor
        presenter.attach(viewController: viewController)
        return viewController
    }
    
}
