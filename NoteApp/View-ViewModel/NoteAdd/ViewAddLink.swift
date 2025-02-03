//
//  ViewAddLink.swift
//  NoteApp
//
//  Created by MacBook Two on 22/01/2025.
//

import SwiftUI

struct ViewAddLink: View {
    @ObservedObject var addNoteModel: ViewModelAddNote = ViewModelAddNote()
    var body: some View {
        VStack {
            VStack {
                Text("ADD LINKS")
                    .font(.headline)
                    .padding()
                // Two text fields inside the modal
                TextField("Id", text: $addNoteModel.linkNoteId)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                TextField("Title", text: $addNoteModel.linkNoteTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                    
                    Button("ADD NEW LINK") {
                        addNoteModel.saveLink()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            if addNoteModel.links.isEmpty {
                Text("You don't have any links Entities in CoreData")
            } else {
                Text("Available Links")
                    .padding(.top,30)
                List(addNoteModel.links, id: \.self) { link in
                    HStack {
                        Text(link.id!)
                        Text(link.title!)
                    }
                    
                }
            }

          
           
        }
        .onAppear {
            addNoteModel.fetchAllLinks()
        }
        .padding()
    }
}

#Preview {
    ViewAddLink()
}
