//
//  CryptoCoinCollectionViewCell.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import UIKit

class CryptoCoinCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var cryptoNameLabel: UILabel!
    
    func modify(with coin: CryptoCoinModel) {
        self.cryptoNameLabel.text = coin.name
        Task { [weak self] in
            guard let image = try? await ImageLoaderRepository().loadImage(fromURL: coin.iconUrl) else {
                // TODO: handle image error, maybe set some other image.
                return
            }
            if !Task.isCancelled {
                self?.iconImageView.image = image
            }
        }
    }
}
