//
//  ImageLoaderRepository.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation
import UIKit

class ImageLoaderRepository {
        
    func loadImage(fromURL urlString: String) async throws -> UIImage {
        
        let urlString = urlString.replacingOccurrences(of: "svg", with: "png")
        guard let url = URL(string: urlString) else {
            throw RemoteAPIError.invalidResponse
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let image = UIImage(data: data) else {
            throw RemoteAPIError.invalidResponse
        }
        return image

    }
}

