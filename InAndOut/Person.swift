//
//  Person.swift
//  InAndOut
//
//  Created by Sam Dindyal on 2018-07-19.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var address: String
    var city: String
    var postalCode: String
    
    init(name: String, address: String, city: String, postalCode: String) {
        self.name = name
        self.address = address
        self.city = city
        self.postalCode = postalCode
        
        super.init()
    }
}
