//
//  Contact.swift
//  AddressBook
//
//  Created by Kyle Harding on 7/17/15.
//  Copyright (c) 2015 Kyle Harding. All rights reserved.
//

import Foundation
import CoreData

class Contact: NSManagedObject {

    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var email: String
    @NSManaged var phone: String
    @NSManaged var street: String
    @NSManaged var city: String
    @NSManaged var state: String

}
