//
//  NoteAppApp.swift
//  NoteApp
//
//  Created by MacBook Two on 17/01/2025.
//

import SwiftUI

@main
struct NoteAppApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ViewRoot()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
