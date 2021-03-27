//
//  NetworkRequest.swift
//  currencyConverter
//
//  Created by Ranieri Aguiar on 22/03/21.
//

import Foundation

enum NetworkError: Error {
    case decodeError
    case requestError
}

protocol NetworkRequestProtocol {
    func getCurrenciesList(completion: @escaping (Result<CurrenciesList, NetworkError>) -> Void)
}

class NetworkRequest {

    private func request<T: Decodable>(target: NetworkTarget, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let session = URLSession.shared
        let request = buildRequest(with: target)

        let task = session.dataTask(with: request) { data, response, error in

            if let dataValue = data {

                if #available(iOS 13.1, *) {
                    guard let obj = try? JSONDecoder().decode(T.self, from: dataValue) else {
                        completion(.failure(.decodeError))
                        return
                    }
                    completion(.success(obj))
                } else {
                    guard let obj = try? JSONSerialization.jsonObject(with: dataValue),
                          let value = obj as? T else {
                        completion(.failure(.decodeError))
                        return
                    }
                    completion(.success(value))
                }

            } else {
                completion(.failure(.requestError))
            }
        }
        task.resume()
    }

    private func buildRequest(with target: NetworkTarget) -> URLRequest {
        var components = URLComponents()
        components.scheme = target.scheme
        components.host = target.host
        components.path = target.path
        components.queryItems = target.requestParameters

        var request = URLRequest(url: components.url!)
        request.httpMethod = target.method.rawValue
        return request
    }

}

extension NetworkRequest: NetworkRequestProtocol {

    func getCurrenciesList(completion: @escaping (Result<CurrenciesList, NetworkError>) -> Void) {
        request(target: .currencyList, completion: completion)
    }
}
