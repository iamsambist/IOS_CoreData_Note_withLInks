//
//  ViewCoreNoteTap.swift
//  NoteApp
//
//  Created by MacBook Two on 20/01/2025.
//

import SwiftUI

struct ViewCoreNoteTap: View {
    @ObservedObject var viewCoreNoteModel = ViewModelCoreNote()
    var body: some View {
        VStack{
            HStack(spacing: 2) {
                
                if viewCoreNoteModel.isTagButtonActive {
                    Picker("tag search", selection: $viewCoreNoteModel.selectedTag) {
                        ForEach(viewCoreNoteModel.tags, id: \.self) { tag in
                            Text(tag).tag(tag)
                            }
                          }
                    .onAppear {
                        viewCoreNoteModel.fetchNotesWithTag()
                    }
                    .onChange(of: viewCoreNoteModel.selectedTag){ _ in
                        viewCoreNoteModel.loadingHtmlData.toggle()
                        viewCoreNoteModel.fetchNotesWithTag()
                    }
                    .pickerStyle(.segmented)  // Use a wheel style for the picker
                    .padding(.leading, 10)
                    .frame(maxHeight: 40)
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, 2)
                } else {
                    TextField("  Search Notes ", text: $viewCoreNoteModel.searchText)
                        .onChange(of: viewCoreNoteModel.searchText){ _ in
                            viewCoreNoteModel.filteredNotesUsingSerachText()
                        }
                        .padding(.leading, 10)
                        .frame(maxHeight: 40)
                        .frame(maxWidth: .infinity)
                        .border(.brown, width: 1)
                        .cornerRadius(15)
                        .opacity(viewCoreNoteModel.isTagButtonActive ? 0 : 1)
                }
                
                Button("SEARCH"){
                    if(viewCoreNoteModel.isTagButtonActive){
                        viewCoreNoteModel.isTagButtonActive = false
                        viewCoreNoteModel.fetchAllTheNotes()
                    }
                }
                .padding(.horizontal,2)
                .buttonStyle(.plain)
                .frame(height: 35)
                .background(viewCoreNoteModel.isTagButtonActive ? .gray : .green )
                .cornerRadius(6)
                
                Button("TAG"){
                    viewCoreNoteModel.isTagButtonActive = true
                }
                .padding(.horizontal,2)
                .buttonStyle(.plain)
                .frame(height: 35)
                .background(viewCoreNoteModel.isTagButtonActive ? .green : .gray )
                .cornerRadius(6)
                
            }
            .frame(height: 40) // Set overall consistent height
            .padding(.horizontal)
            
            VStack {
                Group {
                    if viewCoreNoteModel.isLoading {
                        // Display Progress View while loading
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5)
                    } else if viewCoreNoteModel.allNotes.isEmpty {
                        // Display a message if the list is empty after loading
                        Text("No data available.")
                            .font(.headline)
                            .foregroundColor(.gray)
                    } else {
                        // Display the list of data
                        NavigationStack {
                            List(viewCoreNoteModel.allNotes, id: \ .self) { note in
                                NavigationLink(destination: ViewNoteDetails()){
                                    HStack {
                                        Text(note.id!)
                                        Spacer()
                                        Text(note.tag!)
                                    }
                                }
                                Text(note.title!)
                                Text(note.content!)
                                // Displaying the links associated with the note
                                if let links = note.links as? Set<Link> {
                                    ForEach(Array(links), id: \.self) { link in
                                        HStack {
                                            Text(link.title ?? "NO title")
                                        }
                                    }
                                }
                        }
                    }
                }
            }
                
                HStack {
                    Button(action: {
                        viewCoreNoteModel.deleteAllNoteTapped()
                    }, label: {
                        Text("Delete all notes")
                    })
                    .buttonStyle(.bordered)
                    Spacer()
                    Button(action: {
                        viewCoreNoteModel.deleteAllLinkTapped()
                    }, label: {
                        Text("Delete all links")
                    })
                    .buttonStyle(.bordered)
                }
                .padding(.horizontal,30)
           

            Spacer()
        }
        .onAppear {
            viewCoreNoteModel.fetchAllTheNotes()
            }
        }
       
    }
}

#Preview {
    ViewCoreNoteTap()
}
