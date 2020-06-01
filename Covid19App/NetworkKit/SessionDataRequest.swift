//
//  File.swift
//  
//
//  Created by Manjit on 29/05/2020.
//

import Foundation

public protocol DecodableParserProtocol {
    func parse<T: Decodable>(data: Data?) -> Result<T, ParserError>
}
public enum ParserError: Error {
    case dataMissing
    case internalParserError(Error)
}
protocol ResponseParser {
    associatedtype ParsedObject
    //func parse(data: Data, type: ParsedObject.Type) -> Result<ParsedObject, ParserError>
}

struct DecodableParser<T: Decodable>: ResponseParser {
    
    typealias ParsedObject = T

//    init(parser: DecodableParserProtocol) {
//        self.parser = parser
//    }
//
//    func parse(data: Data, type: ParsedObject.Type) -> Result<ParsedObject, ParserError> {
//        let result = self.parser.parse(data: data) as Result<T, ParserError>
//        return result.mapError { error in
//            ParserError.internalParserError(error)
//        }
//    }
}

public class  NwSessionDataRequest: NSObject, Request {
    
    public let urlSession: URLSession
    public var urlRequest: URLRequest?
    public var response: URLResponse?
    
    public var data: Data? // reponse data
    
    public var error: NetworkError?
    // internal use
    private lazy var receivedData: Data? = Data()
    internal var task: URLSessionTask?

    public func cancel() {
        task?.cancel()
    }
    public func pause() {
        
    }
    public init(urlSession: URLSession,
                urlRequest: URLRequest?) {
        self.urlSession = urlSession
        self.urlRequest = urlRequest
        super.init()
    }
    func startTask() {
        guard let urlRequest = urlRequest else {
            self.error = NetworkError.invalidURL
            self.finish()
            return
        }
        let task = urlSession.dataTask(with: urlRequest)
        
        urlSession.delegateQueue.addOperation {
            task.resume()
        }
    }
    internal func finish() {
        
    }
    internal func addParseOperation<Parser: ResponseParser>(parser: Parser,
                                                            block: @escaping ResponseCallback<Parser.ParsedObject>) {
        
    }

}
extension NwSessionDataRequest: URLSessionDataDelegate {
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        self.response = response as? HTTPURLResponse
        completionHandler(.allow)
    }
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        self.receivedData?.append(data)
    }
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            self.error = .responseError(error)
            finish()
        }
        if let receivedData = self.receivedData,
            receivedData.count > 0 {
            self.data = self.receivedData
            self.receivedData = nil
            finish()
        }
        
    }
    public func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        if let error = error {
            self.error = .responseError(error)
        }
    }
}
extension NwSessionDataRequest: RequestResponses {
    @discardableResult
    public func response(_ completion: @escaping ResponseCallback<Data>) -> Self {
          startTask()
        return self
    }
    
    public func responseDecoded<T: Decodable>(of type: T.Type,
                                          parser: DecodableParserProtocol? = nil,
                                          completion: @escaping ResponseCallback<T>) -> Self {
        startTask()

//        self.parserLelement()
        
        return self
    }

//    @discardableResult
//    public func responseString(_ completion: @escaping ResponseCallback<String>) -> Self {
////        startTask()
//
////        addParseOperation(parser: StringParser()) { response in
////            OperationQueue.main.addOperation {
////                completion(response)
////            }
////        }
//
//        return self
//    }
//
//    @discardableResult
//    public func responseDecoded<T: Decodable>(of type: T.Type = T.self,
//                                              parser: DecodableParserProtocol? = nil,
//                                              completion: @escaping ResponseCallback<T>) -> Self {
//        startTask()
//
//        let parser = parser ?? self.defaultParser
//
//        self.addParseOperation(parser: DecodableParser<T>(parser: parser)) { response in
//            OperationQueue.main.addOperation {
//                completion(response)
//            }
//        }
//
//        return self
//    }
//
//    @discardableResult
//    public func responseDecoded<T: Decodable, E: Decodable>(of type: T.Type = T.self,
//                                                            errorType: E.Type = E.self,
//                                                            parser: DecodableParserProtocol? = nil,
//                                                            completion: @escaping ResponseCallback<T>) -> Self {
//        startTask()
//
//        let parser = parser ?? self.defaultParser
//
//        afterRequestQueue.addOperation {
//            if self.error == nil {
//                self.addParseOperation(parser: DecodableParser<T>(parser: parser)) { response in
//                    OperationQueue.main.addOperation {
//                        completion(response)
//                    }
//                }
//            } else if let error = self.error,
//                case .validateError = error {
//                self.afterRequestQueue.addOperation {
//                    let result: Result<E, ParserError> = parser.parse(data: self.data)
//                    var networkResult: Result<T, NetworkError>
//                    if let errorObject = try? result.get() {
//                        networkResult = .failure(.errorResponse(errorObject))
//                    } else {
//                        networkResult = .failure(error)
//                    }
//
//                    OperationQueue.main.addOperation {
//                        completion(self.responseWithResult(networkResult))
//                    }
//                }
//            }
//        }
//
//        return self
//    }
//
//    @discardableResult
//    public func responseJSON(options: JSONSerialization.ReadingOptions = .allowFragments,
//                             completion: @escaping ResponseCallback<Any>) -> Self {
//        startTask()
//
//        self.addParseOperation(parser: JSONParser()) { response in
//            OperationQueue.main.addOperation {
//                completion(response)
//            }
//        }
//
//        return self
//    }
}
