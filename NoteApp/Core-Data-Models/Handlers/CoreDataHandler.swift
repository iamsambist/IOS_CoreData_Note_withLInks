//
//  CoreDataHandler.swift
//  NoteApp
//
//  Created by MacBook Two on 20/01/2025.
//

import Foundation
import CoreData

class DataContainer {
    
    static var shared = DataContainer()
    
    let container : NSPersistentContainer
    
    init() {
        self.container = NSPersistentContainer(name: "NoteAppModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error While Loading Data. \(error)")
            }
        }
    }
    
    //MARK: - ADD DATA
    
    func addNoteData(id: String, tag: String, title: String, content: String) -> String {
        let noteEntity = Note(context: container.viewContext)
        noteEntity.id = id
        noteEntity.tag = tag
        noteEntity.title = title
        noteEntity.content = content
        
        return saveData()
       
    }
    
    func addLinkData(noteId: String, noteTitle: String) -> String {
        let linkEntity = Link(context: container.viewContext)
        linkEntity.id = noteId
        linkEntity.title = noteTitle
        
        return saveData()
    }
    
    
    func saveData() -> String {
        do {
            try container.viewContext.save()
            return "Data saved successfully."
        } catch let error {
            return "Error while saving data: \(error.localizedDescription)"
        }
    }
    
    //MARK: - FETCH NOTE DATA
    
    func fetchNotes() -> [Note]{
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        var data : [Note] = []
        
        do {
            data = try container.viewContext.fetch(fetchRequest)
        } catch let error {
            print("Error while Fetching CoreData \(error)")
        }
        return data
    }
    
    func fetchNotewith(id: String) -> Note? {
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id==%@",id)
        fetchRequest.fetchLimit = 1
        var note: Note?
        
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            guard let noteData = result.first else { return nil }
            note = noteData
        } catch {
            print("error while fetching note")
        }
        return note
    }
    
    func fetchNoteWithTagHtml() -> [Note]{
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "tag==%@", "HTML")
        var notes : [Note] = []
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            notes = result
        } catch {
            print("error fetching notes using tag")
        }
        return notes
    }
    func fetchNoteWithCSSTag() -> [Note]{
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "tag==%@", "CSS")
        var notes : [Note] = []
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            notes = result
        } catch {
            print("error fetching notes using tag")
        }
        return notes
    }
    
    

    
    //MARK: - FETCH LINK DATA
    func fetchAllLinks() -> [Link]{
        let fetchRequest = NSFetchRequest<Link>(entityName: "Link")
        var data : [Link] = []
        
        do {
            data = try container.viewContext.fetch(fetchRequest)
        } catch let error {
            print("Error while Fetching CoreData \(error)")
        }
        return data
    }
    
    func fetchLink(with noteId: String) -> Link?{
        let fetchRequest: NSFetchRequest<Link> = Link.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", noteId)
        var data: Link?
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            data = result.first
        } catch {
            print("ERROR Fetching Link with NOTEID \(noteId)")
        }
        return data
    }
    
    //MARK: - DELETE DATA
    
    func deleteAllEntityData(entity: String){
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        guard let persistentStoreCoordinator = context.persistentStoreCoordinator else { return }
        do {
            try persistentStoreCoordinator.execute(deleteRequest, with: context)
        } catch let error{
            print("\(error.localizedDescription)")
        }
    }
    
    
    //MARK: - UPDATE DATA
    
    func updateNote(id: String, withLinks: String) -> String{
            if let note = fetchNotewith(id: id),
               let link = fetchLink(with: withLinks) {
                note.addToLinks(link)
                let message = saveData()
                return "link added Successfully = \(message)"
            } else {
                return "Failed to add Link"
        }
    }
}
