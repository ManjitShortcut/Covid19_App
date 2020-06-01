//
//  URLRequest.swift
//  Covid19App
//
//  Created by Manjit on 30/05/2020.
//  Copyright © 2020 Covid19App. All rights reserved.
//

import Foundation

public extension URLRequest {
        init?(baseURL: URL,
          path: String,
          httpMethod: HTTPMethod,
          headerValues: HTTPHeaders? = nil,
          queryParameters: QueryParameters? = nil,
          bodyType: HTTPBodyType,
          body: Encodable? = nil,
          cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) {

        guard let url = URL(baseURL: baseURL, path: path, queryParameters: queryParameters) else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.value

        if let headerValues = headerValues {
            headerValues.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        }

        switch bodyType {
        case .none:
            break
        case let .formEncoded(parameters: parameters):
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            //request.encodeParameters(parameters: parameters)
        case .json:
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = body?.encode()
        }

        request.cachePolicy = cachePolicy

        self = request
    }

}
public extension URL {
    init?(baseURL: URL, path: String, queryParameters: QueryParameters?) {
        guard
            var components = URLComponents(string: baseURL.absoluteString + path)
        else { return nil }

//        if let queryParameters = queryParameters {
//            components.setQueryItems(with: queryParameters)
//        }

        guard let url = components.url else { return nil }

        self = url
    }
}
