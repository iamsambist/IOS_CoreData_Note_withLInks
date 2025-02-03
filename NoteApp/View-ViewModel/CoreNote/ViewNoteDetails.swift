//
//  ViewNoteDetails.swift
//  NoteApp
//
//  Created by MacBook Two on 22/01/2025.
//

import SwiftUI

struct ViewNoteDetails: View {
    var body: some View {
        VStack {
            Text("printing Note with id == 1")
        }.onAppear {
            var note = DataContainer.shared.fetchNotewith(id: "1")
            print(note?.title)
          
            guard let linksSet = note?.links as? Set<Link> else {
                print("No related links found")
                return
            }
            let linksArray = Array(linksSet)
            print(linksArray[0].title)
        }
    }
}

#Preview {
    ViewNoteDetails()
}
