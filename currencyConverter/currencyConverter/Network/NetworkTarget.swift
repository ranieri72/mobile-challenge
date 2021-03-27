//
//  NetworkTarget.swift
//  currencyConverter
//
//  Created by Ranieri Aguiar on 27/03/21.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

enum NetworkTarget {
    case currencyList

    var scheme: String {
        return NetworkConstants.scheme
    }

    var host: String {
        return NetworkConstants.currencylayerHost
    }

    var path: String {
        switch self {
        case .currencyList:
            return "/list"
        }
    }

    var requestParameters: [URLQueryItem] {
        return [URLQueryItem(name: "access_key", value: NetworkConstants.currencylayerApiKey)]
    }

    var method: HttpMethod {
        switch self {
        case .currencyList:
            return .get
        }
    }

}
