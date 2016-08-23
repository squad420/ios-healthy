//
//  LoadDrugsOperation.swift
//  Healthy
//
//  Created by Дмитрий on 23.08.16.
//  Copyright © 2016 klassneckii. All rights reserved.
//

import Foundation
import ObjectMapper

class LoadDrugsOperation: ServiceOperation {
    
    private let request: LoadDrugsRequest
    
    var success: (Array<Drug> -> Void)?
//    var success: (String -> Void)?
    var failure: (NSError -> Void)?
    
    override init() {
        request = LoadDrugsRequest()
        super.init()
    }
    
    override func start() {
        super.start()
        service.request(request, success: handleSuccess, failure: handleFailure)
    }
    
//    private func handleSuccess(response: AnyObject?) {
////        do {
////            let item = try SignInResponseMapper.process(response)
////            let item = "cool"
//            let drugs: Array<Drug> = Mapper<Drug>().mapArray(response)!
//            self.success?(drugs)
//            self.finish()
////        }
////        catch {
////            handleFailure(NSError.cannotParseResponse())
////        }
//    }
    
    private func handleSuccess(response: AnyObject?) {
        let drugs: Array<Drug> = Mapper<Drug>().mapArray(response)!
        self.success?(drugs)
        self.finish()
    }
    
    private func handleFailure(error: NSError) {
        self.failure?(error)
        self.finish()
    }
}