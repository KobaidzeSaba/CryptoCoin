//
//  CryptoCoinDetailsViewController.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import UIKit

class CryptoCoinDetailsViewController: UIViewController {

    @IBOutlet weak var titleCrypto: UILabel!
    weak var sceneDelegate: CryptoCoinDetailsViewSceneDelegate?
    var repositoryDependencies: CryptoCoinPriceRepositoryDependencyContainer?
    var interactor: CryptoCoinDetailsInteractorInput?

    @IBOutlet weak var suggestionContainerView: UIView!
    @IBOutlet weak var historyContainerView: UIView!
    var suggestionVC: CryptoCoinRelatedListViewController?
    var historyVC: CryptoCoinPriceHistoryViewController?
    
    var cryptoCoin : CryptoCoinModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.loadCryptoCoinDetails()
        self.insertSuggestionsScene()
        self.insertHistoryScene()
    }
    
    private func insertSuggestionsScene() {
        self.suggestionVC = CryptoCoinRelatedListViewSceneFactory.makeCryptoCoinRelatedListViewScene(repositoryDependencies!, delegate: sceneDelegate as! CryptoCoinRelatedListViewSceneDelegate).viewController as? CryptoCoinRelatedListViewController
        
        self.addChild(suggestionVC!)
        
        self.suggestionContainerView.addSubview(suggestionVC!.view)
        suggestionVC?.didMove(toParent: self)
        
        let childView = suggestionVC!.view
        suggestionVC?.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([self.suggestionContainerView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: childView!.leadingAnchor, constant: -16),
                                     self.suggestionContainerView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: childView!.trailingAnchor , constant: 16),
                                     self.suggestionContainerView.topAnchor.constraint(equalTo: childView!.topAnchor),
                                     self.suggestionContainerView.bottomAnchor.constraint(equalTo: childView!.bottomAnchor)])
        
    }
    
    private func insertHistoryScene() {
        self.historyVC = CryptoCoinPriceHistoryViewSceneFactory.makeCryptoCoinPriceHistoryViewScene(cryptoCoin!.uuid, repositoryDependencies: repositoryDependencies!) .viewController as? CryptoCoinPriceHistoryViewController
        self.addChild(historyVC!)
        self.historyContainerView.addSubview(historyVC!.view)
        historyVC?.didMove(toParent: self)
        
        let childView = historyVC!.view
        historyVC?.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([self.historyContainerView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: childView!.leadingAnchor),
                                     self.historyContainerView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: childView!.trailingAnchor),
                                     self.historyContainerView.topAnchor.constraint(equalTo: childView!.topAnchor),
                                     self.historyContainerView.bottomAnchor.constraint(equalTo: childView!.bottomAnchor)])

    }
    
}

extension CryptoCoinDetailsViewController: CryptoCoinDetailsPresentation {
    func presentCryptoCoinDetails(coin: CryptoCoinPresentationModel) {
        self.titleCrypto.text = coin.name
    }
}

extension CryptoCoinDetailsViewController: CryptoCoinDetailsViewScene {
    var viewController: UIViewController {
        self
    }
}
