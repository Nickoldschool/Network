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
    
    var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .baseEnvironment: return "https://api.exchangeratesapi.io/"
        }
    }
    
    var baseURL: URL {
        
        //MARK: - Comment
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.exchangeratesapi.io"
        components.path = path
        components.queryItems = queryItems

        return components.url!
        //MARK: - Comment
        
        //MARK: - Uncomment
//        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
//        return url
        //MARK: - Uncomment
        
    }
    
    var path: String {
        switch self {
            
        //MARK: - Comment
        case .base( _):
            return "latest"
        case .fromBaseToCurrent( _, _):
            return "latest"
        case .timePeriodRate( _, _, _, _):
            return "history"
        //MARK: - Comment
            
        //MARK: - Uncomment
//        case .base(let rate):
//            return "latest?base=\(rate)"
//        case .fromBaseToCurrent(let firstRate, let secondRate):
//            return "latest?base=\(firstRate)&symbols=\(secondRate)"
//        case .timePeriodRate(let firstRate, let secondRate, let startDate, let endDate):
//            return "history?base=\(firstRate)&symbols=\(secondRate)&start_at=\(startDate)&end_at=\(endDate)"
        //MARK: - Uncomment
            
        }
    }
    
    //MARK: - Comment
    var queryItems: [URLQueryItem] {
        switch self {
        case .base(let rate):
            return [URLQueryItem(name: "base",     value: rate)]
            
        case .fromBaseToCurrent(let firstRate, let secondRate):
            return [URLQueryItem(name: "base",     value: firstRate),
                    URLQueryItem(name: "symbols",  value: secondRate)]
            
        case .timePeriodRate(let firstRate, let secondRate, let startDate, let endDate):
            return [URLQueryItem(name: "base",     value: firstRate),
                    URLQueryItem(name: "symbols",  value: secondRate),
                    URLQueryItem(name: "start_at", value: startDate),
                    URLQueryItem(name: "end_at",   value: endDate)]
        }
    }
    //MARK: - Comment
    
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
            
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}

