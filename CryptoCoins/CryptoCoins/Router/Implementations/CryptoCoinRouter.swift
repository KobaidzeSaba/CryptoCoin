//
//  CryptoCoinRouter.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation
import UIKit

@MainActor final class CryptoCoinRouter: CryptoRouterProtocol {
    
    let repositoryDependencies: CryptoCoinPriceRepositoryDependencyContainer
    let sceneDependencies: CryptoCoinPriceSceneDependencyContainer
    
    private lazy var initialVC: UINavigationController = {
        let rootScene = sceneDependencies.cryptoCoinListSceneFactory.makeCryptoCoinListViewScene(repositoryDependencies, delegate: self)
        let navVC = UINavigationController(rootViewController: rootScene.viewController)
        return navVC
    }()
    
    private lazy var initialSVC: UISplitViewController = {
        let rootScene = sceneDependencies.cryptoCoinListSceneFactory.makeCryptoCoinListViewScene(repositoryDependencies, delegate: self)
        let detailScene = sceneDependencies.cryptoCoinDetailsSceneFactory.makeCryptoCoinDetailsViewScene(CryptoCoinPresentationModel(cryptoCoin: CryptoCoinModel(uuid: "", symbol: "", name: "", iconUrl: "", price: "")), repositoryDependencies: repositoryDependencies, delegate: self)
        let navVC = UINavigationController(rootViewController: rootScene.viewController)
        let splitVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SplitViewController") as! UISplitViewController
        splitVC.viewControllers = [navVC]
        splitVC.didMove(toParent: navVC)
        return splitVC
    }()

    
    var initialViewController: UIViewController {
        if UIDevice.current.userInterfaceIdiom == .pad {
           return initialSVC
        } else {
           return initialVC
        }
    }

    
    init(_ repositoryDependencies: CryptoCoinPriceRepositoryDependencyContainer,
         sceneDependecies: CryptoCoinPriceSceneDependencyContainer) {
        self.repositoryDependencies = repositoryDependencies
        self.sceneDependencies = sceneDependecies
    }
    
    func displayError(title: String, message: String, retryAction: (()->Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // TODO: Localization
        if let retryAction {
            alert.addAction(UIAlertAction(title: "Retry", style: .default) { _ in
                retryAction()
            })
        }
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        initialVC.topViewController?.present(alert, animated: false)
    }
}

extension CryptoCoinRouter: CryptoCoinListViewSceneDelegate {
    func showCoinDetails(_ coin: CryptoCoinPresentationModel) {
        let detailsScene = sceneDependencies.cryptoCoinDetailsSceneFactory.makeCryptoCoinDetailsViewScene(coin, repositoryDependencies: repositoryDependencies, delegate: self)
        if UIDevice.current.userInterfaceIdiom == .pad {
            initialSVC.showDetailViewController(detailsScene.viewController, sender: nil)
        } else {
            initialVC.present(detailsScene.viewController, animated: true)
        }
    }
}


extension CryptoCoinRouter: CryptoCoinDetailsViewSceneDelegate {
    
}

extension CryptoCoinRouter: CryptoCoinRelatedListViewSceneDelegate {
    
}

