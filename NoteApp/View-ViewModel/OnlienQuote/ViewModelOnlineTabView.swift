//
//  ViewModelOnlineTabView.swift
//  NoteApp
//
//  Created by MacBook Two on 21/01/2025.
//

import Foundation

struct QuoteDTO {
    let id: Int
    let quote : String
    let auther: String
    init(id: Int, quote: String, auther: String) {
        self.id = id
        self.quote = quote
        self.auther = auther
    }
}

class ViewModelOnlineTabView : ObservableObject {
    @Published var quotesList: [QuoteDTO] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    
    func fetchQuotes(){
        isLoading = true
        errorMessage = nil
        MyNetworkApiManager.shared.fetchQuotesData() { response in
                  guard let response = response else { return }
                  self.retrieveListOfQuotes(respose: response)
              } failure: { errMsg in
                  print("Error: \(errMsg ?? "Unknown error")")
              }
    }
    
    func retrieveListOfQuotes(respose: JsonQuoteResponse){
        let optionalQuotes = respose.quotes
        if let quotes = optionalQuotes {
            for quote in quotes {
                if let text = quote.quote,
                   let id = quote.id,
                   let author = quote.author {
                    let objectDto = QuoteDTO(id: id, quote: text, auther: author)
                    quotesList.append(objectDto)
                }
            }
        }
        isLoading = false
    }
}
