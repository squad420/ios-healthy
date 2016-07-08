//
//  Drug.swift
//  Healthy
//
//  Created by Дмитрий on 25.07.16.
//  Copyright © 2016 klassneckii. All rights reserved.
//

import Foundation
import RealmSwift

class Drug: Object {
    
    dynamic var drugID: String = ""
    dynamic var name: String = ""
    dynamic var info : String = ""
    let inSaleSynonyms = List<InSaleSynonym>()
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
