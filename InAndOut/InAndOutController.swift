//
//  InAndOutController.swift
//  InAndOut
//
//  Created by Sam Dindyal on 2018-07-19.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class InAndOutController: UITableViewController {
    var people: People!
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        let detailViewController = segue.source as! DetailViewController
        if  !people.has(person: detailViewController.person),
            let name = detailViewController.nameField.text,
            !name.isEmpty,
            let address = detailViewController.addressField.text,
            let city = detailViewController.cityField.text,
            let postalCode = detailViewController.postalCodeField.text {
            
            let person = Person()
            person.name = name
            person.address = address
            person.city = city
            person.postalCode = postalCode
            
            people.addPerson(person: person)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonCell
        
        let person = people.allPeople[indexPath.row]
        
        cell.nameLabel.text = person.name
        
        
        // Note to self: LEARN FORMATTERS...
        var address = "\(person.address)"
        
        if !(person.address.isEmpty) {
            address += ", "
        }
        
         address += "\(person.city)"
        
        if !(person.postalCode.isEmpty) {
            address += ", "
        }
        
        address += "\(person.postalCode)"
        
        print(address)
        cell.addressLabel.text = address
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.allPeople.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "newPerson":
            print("newPerson")
        case "editPerson":
            if let row = tableView.indexPathForSelectedRow?.row {
                let person = people.allPeople[row]
                
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.person = person
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
}
