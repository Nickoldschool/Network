//
//  HTTPTask.swift
//  Network
//
//  Created by Nick Chekmazov on 01.08.2020.
//  Copyright © 2020 Nick Chekmazov. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?,
                             bodyEncoding: ParameterEncoding,
                            urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
                                       bodyEncoding: ParameterEncoding,
                                      urlParameters: Parameters?,
                                    additionHeaders: HTTPHeaders?)
    
 
}
