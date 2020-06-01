//
//  File.swift
//  
//
//  Created by Manjit on 29/05/2020.
//

import Foundation

public enum HTTPMethod: String {
    case get
    case post
    case delete
    case patch
    case put
    var value: String {
        return rawValue.uppercased()
    }
}
public enum NetworkError: Error {
    case invalidURL
    case parsingError(Error)
    case responseError(Error)
    case dataMissing
    case responseMissing
    case middlewareError(Error)
    case validateError
    case cancelled
}
public typealias HTTPHeaders = [String: String]
public enum HTTPBodyType {
    case json
    case formEncoded(parameters: [String: String])
    case none
}

//public protocol RequestResponses {
//    /// returns the raw data from the request
//    @discardableResult
//    func response(_ completion: @escaping ResponseCallback<Data>) -> Self
//
//    /// returns the response back as a string
//    @discardableResult
//    func responseString(_ completion: @escaping ResponseCallback<String>) -> Self
//
//    /// returns the JSON dictionary from the response
//    @discardableResult
//    func responseJSON(options: JSONSerialization.ReadingOptions,
//                      completion: @escaping ResponseCallback<Any>) -> Self
//
//    /// returns a decoded object of the specified type with the given parser
//    @discardableResult
//    func responseDecoded<T: Decodable>(of type: T.Type,
//                                       parser: DecodableParserProtocol?,
//                                       completion: @escaping ResponseCallback<T>) -> Self
//
//    /// returns a decoded object of the specified type with the given parser
//    /// or... a decoded error object in the network error if the response failed validation
//    ///
//    /// for example... if the server returns a json error that you want to parse, you'll find the passed errorType in
//    /// NetworkError.responseError(Decodable?)
//    @discardableResult
//    func responseDecoded<T: Decodable, E: Decodable>(of type: T.Type,
//                                                     errorType: E.Type,
//                                                     parser: DecodableParserProtocol?,
//                                                     completion: @escaping ResponseCallback<T>) -> Self
//}


public protocol Request: RequestResponses {
    /// the URLRequest that was sent out
    var urlRequest: URLRequest? { get }

    /// the URLResponse returned. could be a HTTPURLResponse if using URLSessionDataRequest
    var response: URLResponse? { get }

    /// the final collection of data returned
    var data: Data? { get }

    /// if an error was encountered, this will have the error
    var error: NetworkError? { get }

    /// cancels the request
    func cancel()
    func pause()
}
