//
//  BackendConfiguration.swift
//  Healthy
//
//  Created by Дмитрий on 23.08.16.
//  Copyright © 2016 klassneckii. All rights reserved.
//

import Foundation

public final class BackendConfiguration {
    
    let baseURL: URL
    
    public init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    public static var shared: BackendConfiguration!
}

