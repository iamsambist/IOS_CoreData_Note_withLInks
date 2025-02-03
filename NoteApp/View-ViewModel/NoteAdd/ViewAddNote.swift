//
//  ViewAddNote.swift
//  NoteApp
//
//  Created by MacBook Two on 22/01/2025.
//

import SwiftUI

struct ViewAddNote: View {
    @ObservedObject var addNoteModel: ViewModelAddNote = ViewModelAddNote()
    
    var body: some View {
        VStack {
            if addNoteModel.displayStatus {
                Text(addNoteModel.responseValue)
            }
            
            TextField("  Note ID", text:$addNoteModel.id )
                .frame(height: 40)
                .border(.black)
                .padding(.horizontal,10)
                .padding(.bottom,10)
            TextField("  Note Tag", text:$addNoteModel.tag )
                .frame(height: 40)
                .border(.black)
                .padding(.horizontal,10)
                .padding(.bottom,10)
            TextField("  Note Title", text:$addNoteModel.title )
                .frame(height: 40)
                .border(.black)
                .padding(.horizontal,10)
                .padding(.bottom,10)
            TextField("  Note Content", text:$addNoteModel.content )
                .frame(height: 40)
                .border(.black)
                .padding(.horizontal,10)
                .padding(.bottom,10)
                
            
            Button(action: {
                addNoteModel.addNote()
            }){
                Text("ADD NOTE")
            }
            .buttonStyle(.borderedProminent)
            .padding(.top,30)
        }
    }
}

#Preview {
    ViewAddNote()
}
