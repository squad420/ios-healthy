//
//  LoadDrugsRequest.swift
//  Healthy
//
//  Created by Дмитрий on 23.08.16.
//  Copyright © 2016 klassneckii. All rights reserved.
//

import Foundation

final class LoadDrugsRequest: BackendAPIRequest {
    
    var endpoint: String {
        return "/api/json/get/4JDJL0EIb"
    }
    
    var method: NetworkService.Method {
        return .POST
    }
    
    var parameters: [String : AnyObject]? {
        return nil
    }
    
    var headers: [String : String]? {
        return defaultJSONHeaders()
    }
}