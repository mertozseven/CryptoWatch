//
//  NetworkManager.swift
//  Crypto Watch
//
//  Created by Mert Ozseven on 3.05.2024.
//

import Foundation
import Alamofire

final class WebService {
    
    static let shared: WebService = {
        let instance = WebService()
        return instance
    }()
    
    private init() {}
    
    func request<T: Decodable>(
        request: URLRequestConvertible,
        decodeType type: T.Type,
        completionHandler: @escaping (Result<T, Error>) -> Void) {
            AF.request(request).responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completionHandler(.success(decodedData))
                    } catch let jsonError as DecodingError {
                        switch jsonError {
                        case .dataCorrupted(let context):
                            print("Data corrupted: \(context)")
                        case .keyNotFound(let key, let context):
                            print("Key '\(key)' not found: \(context.debugDescription), codingPath: \(context.codingPath)")
                        case .typeMismatch(let type, let context):
                            print("Type '\(type)' mismatch: \(context.debugDescription), codingPath: \(context.codingPath)")
                        case .valueNotFound(let value, let context):
                            print("Value '\(value)' not found: \(context.debugDescription), codingPath: \(context.codingPath)")
                        @unknown default:
                            print("Unknown JSON decoding error")
                        }
                        completionHandler(.failure(jsonError))
                    } catch {
                        // Handle any other errors
                        print("Unexpected error: \(error.localizedDescription)")
                        completionHandler(.failure(error))
                    }
                case .failure(let error):
                    // Handle networking error
                    print("Networking error: \(error.localizedDescription)")
                    completionHandler(.failure(error))
                }
            }
        }
    
}
