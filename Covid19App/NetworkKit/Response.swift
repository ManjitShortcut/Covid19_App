//
//  File.swift
//  
//
//  Created by Manjit on 29/05/2020.
//

import Foundation
public struct Response<SuccessType> {
    public var request: URLRequest?
    public var response: URLResponse?
    
    public var data: Data?
    public var result: Result<SuccessType, NetworkError>
    public var responseIsFromCacheProvider: Bool = false
    
    init(_ result: Result<SuccessType, NetworkError>) {
        self.result = result
    }
}
public extension Response {
    var statusCode: Int? {
         guard let response = self.response as? HTTPURLResponse else { return nil }
         return response.statusCode
     }
    var allHeaderFields: [AnyHashable: Any]? {
         guard let response = self.response as? HTTPURLResponse else { return nil }
         return response.allHeaderFields
     }
}



