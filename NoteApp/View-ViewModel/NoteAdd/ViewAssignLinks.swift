//
//  ViewAssignLinks.swift
//  NoteApp
//
//  Created by MacBook Two on 22/01/2025.
//

import SwiftUI

struct ViewAssignLinks: View {
    @ObservedObject var viewModel: ViewModelAssignLink = ViewModelAssignLink()
    var body: some View {
        VStack {
            Text("ADD NOTE ID AND LINK ID")
                .padding(.bottom,30)
            if viewModel.linkAddStatus {
                Text("Link Added SuccessFully")
            }
            TextField("  Note ID", text:$viewModel.noteId )
                .frame(height: 40)
                .border(.black)
                .padding(.horizontal,10)
                .padding(.bottom,10)
            TextField("  Link ID", text:$viewModel.linkToNoteIdOne )
                .frame(height: 40)
                .border(.black)
                .padding(.horizontal,10)
                .padding(.bottom,10)
            Button(action: {
                viewModel.updateNote()
            }, label: {
                Text("Update note with links")
            })
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ViewAssignLinks()
}
