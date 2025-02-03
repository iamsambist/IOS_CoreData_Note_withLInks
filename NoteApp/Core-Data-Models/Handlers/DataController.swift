//
//  DataController.swift
//  NoteApp
//
//  Created by MacBook Two on 20/01/2025.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "NoteAppModel")
    init() {
        container.loadPersistentStores { description, error in
            
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            } else {
                print("CoreData DataModel Loaded SuccessFully ... ")
            }
        }
    }
}
