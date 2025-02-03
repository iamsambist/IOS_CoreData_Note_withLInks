//
//  Link+CoreDataProperties.swift
//  
//
//  Created by MacBook Two on 23/01/2025.
//
//

import Foundation
import CoreData


extension Link {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Link> {
        return NSFetchRequest<Link>(entityName: "Link")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var note: Note?

}
