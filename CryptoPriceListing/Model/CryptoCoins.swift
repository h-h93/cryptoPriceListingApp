//
//  CryptoCoins.swift
//  CryptoPriceListing
//
//  Created by hanif hussain on 08/10/2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let coin = try? JSONDecoder().decode(Coin.self, from: jsonData)

import Foundation

// MARK: - Coin
struct coinData: Codable {
    let data: [coin]
    let info: Info
}

// MARK: - Datum
struct coin: Codable {
    let id, symbol, name, nameid: String
    let rank: Int
    let priceUsd, percentChange24H, percentChange1H, percentChange7D: String
    let priceBtc, marketCapUsd: String
    let volume24, volume24A: Double
    let csupply: String
    let tsupply, msupply: String?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, nameid, rank
        case priceUsd = "price_usd"
        case percentChange24H = "percent_change_24h"
        case percentChange1H = "percent_change_1h"
        case percentChange7D = "percent_change_7d"
        case priceBtc = "price_btc"
        case marketCapUsd = "market_cap_usd"
        case volume24
        case volume24A = "volume24a"
        case csupply, tsupply, msupply
    }
}

// MARK: - Info
struct Info: Codable {
    let coinsNum, time: Int

    enum CodingKeys: String, CodingKey {
        case coinsNum = "coins_num"
        case time
    }
}




