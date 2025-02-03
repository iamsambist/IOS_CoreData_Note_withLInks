//
//  ContentView.swift
//  NoteApp
//
//  Created by MacBook Two on 17/01/2025.
//

import SwiftUI

struct ViewRoot: View {
    @Environment(\.managedObjectContext) var moc
    @State private var isTabViewVisible: Bool = true
    @State private var selectedTab: Int = 0
    var body: some View {
        VStack {
            if isTabViewVisible {
                TabView (selection: $selectedTab){
                    ViewCoreNoteTap()
                        .tabItem{
                            Image(systemName: "network.slash")
                            Text("Core Note")
                        }
                        .tag(0)
                    ViewOnlineTab()
                        .tabItem {
                            Image(systemName: "network")
                            Text("Online Quotes")
                        }
                        .tag(1)
                    ViewBase(isTabVisible: $isTabViewVisible, exitScreen: {
                        isTabViewVisible = true
                        selectedTab = 0
                    })
                        .tabItem {
                            Image(systemName: "note.text.badge.plus")
                            Text("Notes")
                        }
                        .tag(2)
                }
            } else {
                // Ensure BaseView does not show the TabView
                ViewBase(isTabVisible: $isTabViewVisible, exitScreen: {
                    isTabViewVisible = true
                    selectedTab = 0
                })
            }
        }
    }
}

#Preview {
    ViewRoot()
}
