//
//  File.swift
//  
//
//  Created by Manjit on 29/05/2020.
//

import Foundation
public typealias ResponseCallback<SuccessType> = (Response<SuccessType>) -> Void

public protocol RequestResponses {
    @discardableResult
    func response(_ completion: @escaping ResponseCallback<Data>) -> Self
    @discardableResult
    func responseDecoded<T: Decodable>(of type: T.Type,
                                       parser: DecodableParserProtocol?,
                                       completion: @escaping ResponseCallback<T>) -> Self
//    @discardableResult
//    func responseDecoded<T: Decodable, E: Decodable>(of type: T.Type,
//                                                     errorType: E.Type,
//                                                     parser: DecodableParserProtocol?,
//                                                     completion: @escaping ResponseCallback<T>) -> Self
}
