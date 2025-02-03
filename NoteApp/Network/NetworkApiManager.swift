//
//  NetworkApiManager.swift
//  NoteApp
//
//  Created by MacBook Two on 21/01/2025.
//

import Foundation
import Alamofire

class MyNetworkApiManager {
    static let shared = MyNetworkApiManager()
    
    
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        configuration.waitsForConnectivity = true
        
        let networkLogger = MyConnectNetworkLogger()
        
        return Session(configuration: configuration,
                       eventMonitors: [networkLogger])
    }()
    
    func fetchQuotesData(success: @escaping (JsonQuoteResponse?) -> Void, failure: @escaping (String?) -> Void) {
        sessionManager.request(ApiRouters.fetchQuoets)
            .responseDecodable(of: JsonQuoteResponse.self) { response in
                if let resp = response.response, resp.statusCode == 400 {
                    return failure("Something went Wrong")
                }
                
                if let error = response.error {
                    return failure(error.localizedDescription)
                }
                guard let responseValue = response.value else {
                    return failure("Something went wrong")
                }
                success(responseValue)
                
            }
    }
}
