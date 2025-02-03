//
//  ViewOnlineTab.swift
//  NoteApp
//
//  Created by MacBook Two on 20/01/2025.
//

import SwiftUI

struct ViewOnlineTab: View {
    @ObservedObject private var viewModel = ViewModelOnlineTabView()
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            } else if !viewModel.quotesList.isEmpty {
                List(viewModel.quotesList, id: \.id){ quote in
                    VStack(alignment: .leading) {
                        Text(quote.quote)
                            .font(.headline)
                        
                        Text(quote.auther)
                            .font(.subheadline)
                    }
                }
            } else {
                Text("No quotes available.")
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            viewModel.fetchQuotes()
        }
        .padding()
    }
}

#Preview {
    ViewOnlineTab()
}
