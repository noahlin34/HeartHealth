//
//  Persistence.swift
//  HeartHealth
//
//  Created by Noah Lin  on 2023-07-15.
//

import CoreData

struct PersistenceController {
    
    
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        
    
        let contact = Contact(context: viewContext)
        contact.name = "Noah Lin"
        contact.id = UUID()
        contact.email = "nglin34@gmail.com"
        contact.notes = "notes"
        contact.number = "123123123"
        contact.numberExtension = 1233
        contact.position = "doctor"
        
        let medicine = Medication(context: viewContext)
        medicine.id = UUID()
        medicine.dateAdded = Date()
        medicine.dosage = 2
        medicine.dosageFrequency = "Every Day"
        medicine.name = "Aspirin"
        medicine.notes = "wejir"

        let appointment = Appointment(context: viewContext)
        appointment.id = UUID()
        appointment.date = Date()
        appointment.category = "Surgery"
        appointment.questions = "UHH STUFF?"
        appointment.notes = "Some notes"
        
        
        let user = User(context: viewContext)
        user.name = "Noah"
        
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        
        
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "HeartHealth")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
