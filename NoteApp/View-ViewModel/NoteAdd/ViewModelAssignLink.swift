//
//  ViewModelAssignLink.swift
//  NoteApp
//
//  Created by MacBook Two on 22/01/2025.
//

import Foundation
class ViewModelAssignLink: ObservableObject {
    @Published var noteId: String = ""
    @Published var linkToNoteIdOne: String = ""
    @Published var linkAddStatus: Bool = false
    @Published var message: String = ""
    func updateNote(){
        message = DataContainer.shared.updateNote(id: noteId, withLinks: linkToNoteIdOne)
        clearLinks()
        linkAddStatus = true
    }
    
    func clearLinks(){
        noteId = ""
        linkToNoteIdOne = ""
    }
    
 
}
