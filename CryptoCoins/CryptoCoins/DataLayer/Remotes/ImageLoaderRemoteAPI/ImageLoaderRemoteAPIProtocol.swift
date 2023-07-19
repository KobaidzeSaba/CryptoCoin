//
//  ImageLoaderRemoteAPIProtocol.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation
import UIKit

protocol ImageLoaderRemoteAPIProtocol {
    func loadImage(with url: URL) async throws -> UIImage
}
