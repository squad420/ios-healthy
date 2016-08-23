//
//  Drug.swift
//  Healthy
//
//  Created by Дмитрий on 25.07.16.
//  Copyright © 2016 klassneckii. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Drug: Object, Mappable {
    
    dynamic var drugID: String = ""
    dynamic var name: String = ""
    dynamic var info : String = ""
    let inSaleSynonyms = List<InSaleSynonym>()
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        drugID <- map["objectId"]
        name <- map["name"]
    }
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
