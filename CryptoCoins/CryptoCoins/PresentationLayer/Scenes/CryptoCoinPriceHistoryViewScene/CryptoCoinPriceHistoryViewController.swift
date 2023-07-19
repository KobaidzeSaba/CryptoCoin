//
//  CryptoCoinPriceHistoryViewController.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import UIKit

class CryptoCoinPriceHistoryViewController: UIViewController {

    weak var sceneDelegate: CryptoCoinPriceHistoryViewSceneDelegate?
    var interactor: CryptoCoinPriceHistoryInteractorInput?
    var dependencies: CryptoCoinPriceRepositoryDependencyContainer?

    var coinUUID: String?

    @IBOutlet weak var tableView: UITableView!
    
    var list : [CryptoCoinHistoryPresentationModel] = []
    
    private enum Section: Hashable {
        case main
    }

    private lazy var tableViewDataSource: UITableViewDiffableDataSource<Section, CryptoCoinHistoryPresentationModel> = {
        let dataSource = UITableViewDiffableDataSource<Section, CryptoCoinHistoryPresentationModel>(tableView: tableView) { tableView, _ ,model in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CryptoCoinPriceHistoryTableViewCell else {
                return UITableViewCell()
            }
            cell.modify(with: model)
            return cell
        }
        return dataSource
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let uuid = coinUUID else {
            return
        }
        self.interactor?.loadCryptoCoinPriceHistory(uuid)
    }
    
    private func presentCryptoPriceHistoryList(list: [CryptoCoinHistoryPresentationModel]) {
        self.list = list
        var snapshot = NSDiffableDataSourceSnapshot<Section,CryptoCoinHistoryPresentationModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        tableViewDataSource.apply(snapshot)
    }

}


extension CryptoCoinPriceHistoryViewController: CryptoCoinPriceHistoryPresentation {
    func presentCryptoCoinPriceHistory(with history: [CryptoCoinHistoryPresentationModel]) {
        presentCryptoPriceHistoryList(list: history)
    }
}

extension CryptoCoinPriceHistoryViewController: CryptoCoinPriceHistoryViewScene {
    var viewController: UIViewController {
        self
    }
}

