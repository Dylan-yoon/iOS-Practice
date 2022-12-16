//
//  Person.swift
//  CoreDataPractice
//
//  Created by Dylan_Y on 2022/12/09.
//

import CoreData

extension Person {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var gender: Bool
    @NSManaged public var age: Int
    @NSManaged public var uuid: UUID
}
