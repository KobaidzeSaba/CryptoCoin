//
//  ImageLoaderRemoteAPI.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation
import UIKit

final class ImageLoaderRemoteAPI: ImageLoaderRemoteAPIProtocol {
    func loadImage(with url: URL) async throws -> UIImage {
        guard let url = URL(string: url.absoluteString.replacingOccurrences(of: ".svg", with: ".png")) else {
            throw RemoteAPIError.invalidResponse
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let image = UIImage(data: data) else {
            throw RemoteAPIError.invalidResponse
        }
        return image
    }
}
