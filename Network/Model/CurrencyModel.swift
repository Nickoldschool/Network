//
//  CurrencyModel.swift
//  Network
//
//  Created by Nick Chekmazov on 01.08.2020.
//  Copyright © 2020 Nick Chekmazov. All rights reserved.
//

import UIKit

struct CurrencyData: Decodable {
    let base: String
    let date: String
    let rates: [String: Double]
    
    init(base: String, date: String, rates: [String: Double]) {
        self.base   = base
        self.date   = date
        self.rates  = rates
    }
}

struct Rate: Decodable {
    let currency: String
    let rate: Double
    
    init(currency: String, rate: Double) {
        self.currency   = currency
        self.rate       = rate
    }
}

struct TwoCurrencies: Decodable {
    let base: String
    let startDate: String
    let endDate: String
    let rates: [String: [String: Double]]
    
    init(base: String, startDate: String, endDate: String, rates: [String: [String: Double]]) {
        self.base   = base
        self.startDate   = startDate
        self.endDate   = endDate
        self.rates  = rates
    }
}

extension TwoCurrencies {

    private enum TwoCurrenciesCodingKeys: String, CodingKey {
          case base
          case startDate = "start_at"
          case endDate = "end_at"
          case rates
      }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TwoCurrenciesCodingKeys.self)

        base = try container.decode(String.self, forKey: .base)
        startDate = try container.decode(String.self, forKey: .startDate)
        endDate = try container.decode(String.self, forKey: .endDate)
        rates = try container.decode([String: [String: Double]].self, forKey: .rates)

    }

}
