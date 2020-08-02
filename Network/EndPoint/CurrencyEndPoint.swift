//
//  CurrencyEndPoint.swift
//  Network
//
//  Created by Nick Chekmazov on 01.08.2020.
//  Copyright © 2020 Nick Chekmazov. All rights reserved.
//

import Foundation


enum NetworkEnvironment {
    case baseEnvironment
}

public enum CurrencyApi {
    
    case base(rate: String)
    case fromBaseToCurrent(firstRate: String,secondRate: String)
    case timePeriodRate(firstRate: String, secondRate: String, startDate: String, endDate: String)
    
    
    
}

extension CurrencyApi: EndPointType {
    
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .baseEnvironment: return "https://api.exchangeratesapi.io/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .base(let rate):
            return "latest?base=\(rate)"
        case .fromBaseToCurrent(let firstRate, let secondRate):
            return "latest?base=\(firstRate)&symbols=\(secondRate)"
        case .timePeriodRate(let firstRate, let secondRate, let startDate, let endDate):
            return "history?base=\(firstRate)&symbols=\(secondRate)&start_at=\(startDate)&end_at=\(endDate)"
          
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
         
        //MARK: - Check if correct works!
        case .base(let rate):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .jsonEncoding,
                                      urlParameters: ["base":rate])
        //MARK: - Check if correct works!
            
          //MARK: - Delete
//        case .newMovies(let page):
//            return .requestParameters(bodyParameters: nil,
//                                      bodyEncoding: .urlEncoding,
//                                      urlParameters: ["page":page,
//                                                      "api_key":NetworkManager.CurrencyAPIKey])
          //MARK: - Delete
            
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}

//let base = "EUR"
//
//var urlComponents = URLComponents()
//
//urlComponents.scheme = "https"
//urlComponents.host = "api.exchangeratesapi.io"
//urlComponents.path = "/latest"
//urlComponents.queryItems = [URLQueryItem(name: "base", value: base)]
