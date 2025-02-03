//
//  ViewSearch.swift
//  NoteApp
//
//  Created by MacBook Two on 20/01/2025.
//

import SwiftUI

class ViewModelCoreNote: ObservableObject {
    @Published var searchText: String = ""
    @Published var isTagButtonActive: Bool = false
    @Published var tags : [String] = ["HTML","CSS"]
    @Published var selectedTag: String = "HTML"
    
    
    //MARK: - UI PROPERTIES
    @Published var allNotes: [Note] = []
    @Published var isLoading: Bool = false
    
    @Published var loadingHtmlData: Bool = true
    @Published var filteredNotes: [Note] = []
    
    var links: [Link] = []
    
    init(){
        let data = DataContainer.shared.fetchAllLinks()
        for datum in data {
            print("NOTE ID = \(datum.id ?? "id") AND Link Message = \(datum.title ?? "title")")
        }
    }
    
    func filteredNotesUsingSerachText() {
        if searchText.isEmpty {
            filteredNotes = allNotes
        } else {
            filteredNotes =  allNotes.filter { note in
                note.title?.localizedCaseInsensitiveContains(searchText) == true
            }
        }
    }
   
    func fetchNotesWithTag(){
        if loadingHtmlData {
            allNotes = DataContainer.shared.fetchNoteWithTagHtml()
        } else {
            allNotes =  DataContainer.shared.fetchNoteWithCSSTag()
        }
    }
    
    func fetchAllTheNotes() {
        allNotes = DataContainer.shared.fetchNotes()
    }
    func fetchNotewith(id: String) -> Note? {
       let note =  DataContainer.shared.fetchNotewith(id: id)
        return note
    }
    
    func deleteAllNoteTapped(){
        DataContainer.shared.deleteAllEntityData(entity: "Note")
    }
    func deleteAllLinkTapped(){
        DataContainer.shared.deleteAllEntityData(entity: "Link")
    }
    
    
    func clearSerachText() {
        searchText.removeAll()
    }
}

