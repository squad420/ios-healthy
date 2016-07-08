//
//  InSaleSynonym.swift
//  Healthy
//
//  Created by Дмитрий on 25.07.16.
//  Copyright © 2016 klassneckii. All rights reserved.
//

import Foundation
import RealmSwift

class InSaleSynonym: Object {
    
    dynamic var synonymID : String = ""
    dynamic var name : String = ""
    dynamic var price : Int = 0
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
