//
//  File.swift
//  
//
//  Created by Manjit on 29/05/2020.
//

import Foundation

public protocol NetworkType {
    func request(URL: URL,
                 method: HTTPMethod,
                 bodyType: Data?,
                 headerValues: HTTPHeaders?,
                 body: Encodable?,
                 queryParameters query: QueryParameters?)-> Request
    
}
extension NetworkType {
    
}
public class Network: NSObject {
//    var urlSession: URLSession!
//    var sessionRequest: NwSessionDataRequest!
//    public func request(URL: URL, method: HTTPMethod, bodyType: Data?, headerValues: HTTPHeaders?, body: Encodable?, queryParameters query: QueryParameters?)-> Request {
//        let urlrRquest =  URLRequest(baseURL:URL,path: "",httpMethod: method,headerValues: headerValues,queryParameters: query,bodyType: .json,body: body)
//        sessionRequest = NwSessionDataRequest(urlSession: self.urlSession, urlRequest: urlrRquest)
//        return sessionRequest
//    }
//    public init(urlSessionConfiguration: URLSessionConfiguration = .default) {
//        super.init()
//        self.urlSession = URLSession(configuration: urlSessionConfiguration,
//                                     delegate: self, delegateQueue: nil)
//    }
    
    func fetch<T: Codable>(url: String, completion: @escaping  (Result<T, Error>) -> ()) {
           let baseURL = URL(string:url)
           guard let url = baseURL else {
               return
           }
           URLSession.shared.dataTask(with: url) { (data, response, error) in
               if let error = error {
                   completion(.failure(error))
               }
               do {
                   let response = try JSONDecoder().decode(T.self, from: data!)
                   completion(.success(response))
               } catch let err {
                   completion(.failure(err))
               }
           }.resume()
       }
       
    
}
extension Network: URLSessionDataDelegate {
    
//    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
//        sessionRequest.urlSession(session, task: task, didCompleteWithError: error)
//
//    }
//    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
//        sessionRequest.urlSession(session, dataTask: dataTask, didReceive: data)
//
//    }
//    public func urlSession(_ session: URLSession,
//                    dataTask: URLSessionDataTask,
//                    didReceive response: URLResponse,
//                    completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
//        sessionRequest.urlSession(session,
//                           dataTask: dataTask,
//                           didReceive: response,
//                           completionHandler: completionHandler)
//
//
//    }
}

