//
//  ViewModelAddNote.swift
//  NoteApp
//
//  Created by MacBook Two on 20/01/2025.
//

import Foundation

class ViewModelAddNote : ObservableObject {
    @Published var title: String = ""
    @Published var content: String = ""
    @Published var id: String = ""
    @Published var tag: String = ""
    @Published var links: [Link] = []
    
    @Published var linkNoteId: String = ""
    @Published var linkNoteTitle: String = ""
    
    
    //MARK: - NOTIFICATION PROPERTIES
    @Published var responseValue: String = ""
    @Published var displayStatus: Bool = false
    @Published var showSheet: Bool = false
    
    
    func addNote() {
        responseValue = DataContainer.shared.addNoteData(id: id, tag: tag, title: title, content: content)
        clearProperties()
        displayStatus = true
        
    }
    
    func saveLink(){
        responseValue = DataContainer.shared.addLinkData(noteId: linkNoteId, noteTitle: linkNoteTitle)
        clearProperties()
        displayStatus = true
        showSheet = false
        fetchAllLinks()
        
    }
    
    func fetchAllLinks() {
        links = DataContainer.shared.fetchAllLinks()
    }
    
    func clearProperties(){
        title = ""
        content = ""
        id = ""
        tag = ""
        links = []
        linkNoteId = ""
        linkNoteTitle = ""
    }
    
    
    
}

struct Linkers {
    var id: String
    var title: String
}
