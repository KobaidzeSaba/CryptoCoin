//
//  CryptoCoinRelatedListViewController.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import UIKit

class CryptoCoinRelatedListViewController: UIViewController {

    weak var sceneDelegate: CryptoCoinRelatedListViewSceneDelegate?
    var interactor: CryptoCoinRelatedListInteractorInput?

    @IBOutlet weak var collectionView: UICollectionView!
    
    var dependencies: CryptoCoinPriceRepositoryDependencyContainer?
    
    var list: [CryptoCoinModel] = []
    
    private enum Section: Hashable {
        case main
    }
    
    private lazy var collectionViewDataSource: UICollectionViewDiffableDataSource<Section, CryptoCoinModel> = {
        let dataSource = UICollectionViewDiffableDataSource<Section, CryptoCoinModel>(collectionView: collectionView) { (collectionView, indexPath, coin) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CryptoCoinCollectionViewCell
            cell.modify(with: coin)
            return cell
        }
        
        return dataSource
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.loadCryptoCoinRelated()
    }
    
    private func showCryptoCoinRelatedList(list: [CryptoCoinModel]) {
        self.list = list
        var snapshot = NSDiffableDataSourceSnapshot<Section,CryptoCoinModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        collectionViewDataSource.apply(snapshot)
    }

}

extension CryptoCoinRelatedListViewController: CryptoCoinRelatedListPresentation {
    func presentCryptoCoinRelatedList(list: [CryptoCoinModel]) {
        self.list = list
        self.showCryptoCoinRelatedList(list: list)
    }
}

extension CryptoCoinRelatedListViewController: CryptoCoinRelatedListViewScene {
    var viewController: UIViewController {
        self
    }
}
