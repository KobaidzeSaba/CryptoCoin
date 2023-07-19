//
//  CryptoListResponseModel.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

struct CryptoListResponseModel: Codable {
   let coins: [CryptoCoinModel]
}
