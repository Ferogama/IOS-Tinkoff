//
//  User+CoreDataProperties.swift
//  Tinkoff
//
//  Created by Meiers on 31.03.2023.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var balance: Int64
    @NSManaged public var name: String?

}

extension User : Identifiable {

}
