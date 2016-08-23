//
//  BackendAPIRequest.swift
//  Healthy
//
//  Created by Дмитрий on 23.08.16.
//  Copyright © 2016 klassneckii. All rights reserved.
//

import Foundation

protocol BackendAPIRequest {
    var endpoint: String { get }
    var method: NetworkService.Method { get }
    var parameters: [String: AnyObject]? { get }
    var headers: [String: String]? { get }
}

extension BackendAPIRequest {
    
    func defaultJSONHeaders() -> [String: String] {
        return ["Content-Type": "application/json"]
    }
}