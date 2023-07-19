//
//  CryptoCoinRankingRemoteAPI.swift
//  CryptoCoins
//
//  Created by Saba Kobaidze on 19.07.23.
//

import Foundation

fileprivate struct CryptoCoinRankingListResponseModel: Codable {
   let data: CryptoListResponseModel
   let status: String
}

fileprivate struct CryptoCoinRankingHistoryResponseModel: Codable {
   let data: CryptoCoinHistoryModel
   let status: String
}

final class CryptoCoinRankingRemoteAPI: CryptoCoinRankingRemoteAPIProtocol {
    
    let baseURL = "https://api.coinranking.com/v2/coins?limit=30"
    private let apiKey = "coinranking567b45059fe5b71971b3319d6f3ad3d5656a43adf65e0703"
    
    
    func loadCryptoList() async throws -> [CryptoCoinModel] {
        
        let url = URL(string: baseURL)!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw RemoteAPIError.invalidResponse
        }
        
        guard let responseModel = try? JSONDecoder().decode(CryptoCoinRankingListResponseModel.self, from: data) else {
            throw RemoteAPIError.invalidResponse
        }
        
        return responseModel.data.coins

    }
    
    func loadCryptoListPage(_ page: Int) async throws -> [CryptoCoinModel] {
        let limit = 30
        let offset = page * limit
        let paginationURL = "https://api.coinranking.com/v2/coins?limit=\(limit)&offset=\(offset)"
        let url = URL(string: paginationURL)!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw RemoteAPIError.invalidResponse
        }
        
        guard let responseModel = try? JSONDecoder().decode(CryptoCoinRankingListResponseModel.self, from: data) else {
            throw RemoteAPIError.invalidResponse
        }
        
        return responseModel.data.coins
    }
    
    func loadCryptoCoinPriceHistory(_ uuid: String) async throws -> CryptoCoinHistoryModel {
        let historyUrl = "https://api.coinranking.com/v2/coin/\(uuid)/history?timePeriod=7d"
    
        let url = URL(string: historyUrl)!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw RemoteAPIError.invalidResponse
        }
        
        guard let responseModel = try? JSONDecoder().decode(CryptoCoinRankingHistoryResponseModel.self, from: data) else {
            throw RemoteAPIError.invalidResponse
        }
        return responseModel.data
    }
}
