//
//  Router.swift
//  Crypto Watch
//
//  Created by Mert Ozseven on 3.05.2024.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case topRanking
    
    var method: HTTPMethod {
        switch self {
        case .topRanking:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .topRanking:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        JSONEncoding.default
    }
    
    var url: URL {
        switch self {
        case .topRanking:
            let url = URL(string: Constants.url)
            return url!
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
    
}

