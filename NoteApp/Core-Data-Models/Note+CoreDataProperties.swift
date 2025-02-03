//
//  Note+CoreDataProperties.swift
//  
//
//  Created by MacBook Two on 23/01/2025.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var content: String?
    @NSManaged public var id: String?
    @NSManaged public var tag: String?
    @NSManaged public var title: String?
    @NSManaged public var links: NSSet?

}

// MARK: Generated accessors for links
extension Note {

    @objc(addLinksObject:)
    @NSManaged public func addToLinks(_ value: Link)

    @objc(removeLinksObject:)
    @NSManaged public func removeFromLinks(_ value: Link)

    @objc(addLinks:)
    @NSManaged public func addToLinks(_ values: NSSet)

    @objc(removeLinks:)
    @NSManaged public func removeFromLinks(_ values: NSSet)

}
