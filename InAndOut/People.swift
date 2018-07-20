//
//  People.swift
//  InAndOut
//
//  Created by Sam Dindyal on 2018-07-19.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class People {
    var allPeople = [Person]()
    
    @discardableResult func addPerson(person: Person = Person()) -> Person {
        if !self.has(person: person) {
            allPeople.append(person)
        }
        return person
    }
    
    func has(person: Person) -> Bool {
        return allPeople.contains(person)
    }
}
