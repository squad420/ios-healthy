//
//  NetworkService.swift
//  Healthy
//
//  Created by Дмитрий on 23.08.16.
//  Copyright © 2016 klassneckii. All rights reserved.
//

import Foundation

class NetworkService {
    
    fileprivate var task: URLSessionDataTask?
    fileprivate var successCodes = 200...299
    fileprivate var failureCodes = 400...499
    
    enum Method: String {
        case GET, POST, PUT, DELETE
    }
    
    func request(url: URL, method: Method,
                     params: [String: AnyObject]? = nil,
                     headers: [String: String]? = nil,
                     success: ((Data?) -> Void)? = nil,
                     failure: ((_ data: Data?, _ error: NSError?, _ responseCode: Int) -> Void)? = nil) {
        var mutableRequest = NSMutableURLRequest(url: url,
                                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                                 timeoutInterval: 10.0)
        mutableRequest.allHTTPHeaderFields = headers
        mutableRequest.httpMethod = method.rawValue
        if let params = params {
            mutableRequest.httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
        }
        
        let session = URLSession.shared
        

        task = session.dataTask(with: mutableRequest, completionHandler: { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                failure?(data: data, error: error, responseCode: 0)
                return
            }
            
            if let error = error {
                failure?(data: data, error: error, responseCode: httpResponse.statusCode)
                return
            }
            
            if self.successCodes.contains(httpResponse.statusCode) {
                print("Request finished with success.")
                success?(data)
            } else if self.failureCodes.contains(httpResponse.statusCode) {
                print("Request finished with failure.")
                failure?(data: data, error: error, responseCode: httpResponse.statusCode)
            } else {
                print("Request finished with serious failure.")
                // Server returned response with status code different than
                // expected `successCodes`.
                let info = [
                    NSLocalizedDescriptionKey: "Request failed with code \(httpResponse.statusCode)",
                    NSLocalizedFailureReasonErrorKey: "Wrong handling logic, wrong endpoing mapping or backend bug."
                ]
                let error = NSError(domain: "NetworkService", code: 0, userInfo: info)
                failure?(data: data, error: error, responseCode: httpResponse.statusCode)
            }

        })

        
        task?.resume()
    }
    
    func cancel() -> Void {
        task?.cancel()
    }
}
