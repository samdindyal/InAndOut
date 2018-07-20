//
//  DetailViewController.swift
//  InAndOut
//
//  Created by Sam Dindyal on 2018-07-20.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var person: Person!
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var cityField: UITextField!
    @IBOutlet var postalCodeField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if person != nil {
         navigationItem.title = person.name
            
        nameField.text          = person.name
        addressField.text       = person.address
        cityField.text          = person.city
        postalCodeField.text    = person.postalCode
        } else {
            person = Person()
        }
        
 
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let name = nameField.text, name.isEmpty {
            print("Could not save person")

        } else {
            person.name = nameField.text!
            person.address = addressField.text!
            person.city = cityField.text!
            person.postalCode = postalCodeField.text!
        }
    }
}
