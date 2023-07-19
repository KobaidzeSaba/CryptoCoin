//
//  CryptoCoinListTableViewCell.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import UIKit

class CryptoCoinListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func modify(with coin: CryptoCoinPresentationModel) {
        self.nameLabel.text = coin.name
        self.priceLabel.text = coin.price
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
