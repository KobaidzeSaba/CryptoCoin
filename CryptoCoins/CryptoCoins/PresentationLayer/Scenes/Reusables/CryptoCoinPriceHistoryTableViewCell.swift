//
//  CryptoCoinPriceHistoryTableViewCell.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import UIKit

class CryptoCoinPriceHistoryTableViewCell: UITableViewCell {

    func modify(with historyPrice:CryptoCoinHistoryPresentationModel) {
        self.textLabel?.text = historyPrice.price
        self.detailTextLabel?.text = historyPrice.date
    }

}
