//
//  EntityBook+CoreDataProperties.swift
//  BooksOnTheTable
//
//  Created by José Inácio Athayde Ferrarini on 08/04/21.
//
//

import Foundation
import CoreData


extension EntityBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntityBook> {
        return NSFetchRequest<EntityBook>(entityName: "Book")
    }

    @NSManaged public var remoteId: String?
    @NSManaged public var title: String?
    @NSManaged public var author: String?
    @NSManaged public var genre: String?
    @NSManaged public var status: String?

}

extension EntityBook : Identifiable {

}
