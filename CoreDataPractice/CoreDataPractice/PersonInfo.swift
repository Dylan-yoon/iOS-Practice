//
//  PersonInfo.swift
//  CoreDataPractice
//
//  Created by Dylan_Y on 2022/12/09.
//

import UIKit
import CoreData

struct PersonInfo {
    var name: String
    var gender: Bool
    var age: Int
    var uuid: UUID
    
    func coreDataRegist() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)
        
        if let entity = entity {
            let person = NSManagedObject(entity: entity, insertInto: context)
            person.setValue(self.name, forKey: "name")
            person.setValue(self.gender, forKey: "gender")
            person.setValue(self.age, forKey: "age")
            person.setValue(self.uuid, forKey: "uuid")
        }
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
