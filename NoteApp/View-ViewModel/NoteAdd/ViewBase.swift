//
//  ViewBase.swift
//  NoteApp
//
//  Created by MacBook Two on 22/01/2025.
//

import SwiftUI

struct ViewBase: View {
    @Binding var isTabVisible: Bool
    var exitScreen : (() -> Void)?
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    exitScreen?()
                }, label: {
                    Text("Exit Notes Screen")
                })
                .buttonStyle(.borderedProminent)
            }
            TabView {
                ViewAddNote()
                    .tabItem{
                        Image(systemName: "list.bullet.clipboard")
                        Text("New note")
                    }
                ViewAddLink()
                    .tabItem {
                        Image(systemName: "link")
                        Text("New link")
                    }
                ViewAssignLinks()
                    .tabItem {
                        Image(systemName: "heart.circle.fill")
                        Text("Relationship")
                    }
            }
        }
        .onAppear {
            isTabVisible = false
        }
    }
}

#Preview {
    ViewBase(isTabVisible: .constant(true))
}
