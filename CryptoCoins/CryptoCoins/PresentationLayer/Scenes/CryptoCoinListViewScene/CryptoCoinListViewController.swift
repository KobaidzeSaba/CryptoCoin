//
//  CryptoCoinListViewController.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import UIKit

class CryptoCoinListViewController: UIViewController, CryptoCoinListPresentation {
    
    @IBOutlet weak var tableView: UITableView!
    var list : [CryptoCoinPresentationModel] = []
    var interactor: CryptoCoinListInteractorInput?
    
    weak var sceneDelegate: CryptoCoinListViewSceneDelegate?
    
    enum Section: Hashable {
        case main
    }
    
    private lazy var tableViewDataSource: UITableViewDiffableDataSource<Section, CryptoCoinPresentationModel> = {
        let dataSource = UITableViewDiffableDataSource<Section, CryptoCoinPresentationModel>(tableView: tableView) { tableView, _ ,model in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CryptoCoinListTableViewCell else {
                return UITableViewCell()
            }
            cell.modify(with: model)
            return cell
        }
        return dataSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.interactor?.loadCryptoList()
    }
    
    func presentCryptoList(list: [CryptoCoinPresentationModel]) {
        self.list = list
        var snapshot = NSDiffableDataSourceSnapshot<Section,CryptoCoinPresentationModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        tableViewDataSource.apply(snapshot)
        if UIDevice.current.userInterfaceIdiom == .pad && list.count > 0 {
            self.sceneDelegate?.showCoinDetails(list[0])
        }
    }
    
    func presentCryptoListNextPage(list: [CryptoCoinPresentationModel]) {
        var oldSnapshot = tableViewDataSource.snapshot()
        oldSnapshot.appendItems(list, toSection: .main)
        self.list.append(contentsOf: list)
        tableViewDataSource.apply(oldSnapshot, animatingDifferences: true)
    }
    
}

extension CryptoCoinListViewController: CryptoCoinListViewScene {
    var viewController: UIViewController {
        self
    }
}


extension CryptoCoinListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.sceneDelegate?.showCoinDetails(list[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == list.count - 1 {
            interactor?.loadCryptoListNextPage()
        }
    }
    
}
