//
//  CryptoCoinRelatedListScene.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation
import UIKit

protocol CryptoCoinRelatedListViewScene {
    var viewController: UIViewController { get }
}

protocol CryptoCoinRelatedListViewSceneDelegate: AnyObject {
    func displayError(title: String, message: String, retryAction: (()->Void)?)
}

@MainActor protocol CryptoCoinRelatedListViewSceneFactoryProtocol {
    static func makeCryptoCoinRelatedListViewScene(_ repositoryDependencies: CryptoCoinPriceRepositoryDependencyContainer,
                                        delegate: CryptoCoinRelatedListViewSceneDelegate) -> CryptoCoinRelatedListViewScene
}

@MainActor final class CryptoCoinRelatedListViewSceneFactory: CryptoCoinRelatedListViewSceneFactoryProtocol {
    
    
    
    static func makeCryptoCoinRelatedListViewScene(_ repositoryDependencies: CryptoCoinPriceRepositoryDependencyContainer,
                                        delegate: CryptoCoinRelatedListViewSceneDelegate) -> CryptoCoinRelatedListViewScene {
        let presenter = CryptoCoinRelatedListPresenter()
        let interactor = CryptoCoinRelatedListInteractor(with: presenter, dependencies: repositoryDependencies)
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "suggestions") as! CryptoCoinRelatedListViewController
        viewController.sceneDelegate = delegate
        viewController.interactor = interactor
        viewController.dependencies = repositoryDependencies
        presenter.attach(viewController: viewController)
        return viewController
    }
    
}
