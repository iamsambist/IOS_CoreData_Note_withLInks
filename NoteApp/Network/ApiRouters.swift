//
//  ApiRouters.swift
//  NoteApp
//
//  Created by MacBook Two on 21/01/2025.
//

import Foundation
import Alamofire

enum ApiRouters: URLRequestConvertible {
    
    case fetchImages(searchKey: String)
    case fetchQuoets
    
    // MARK: - BASE URL
    var baseUrl: String {
        switch self {
        case .fetchImages:
            return "https://pixabay.com/api/"
        case .fetchQuoets:
           return "https://dummyjson.com/quotes/"
        }
    }
    // MARK: - METHOD
    var method : HTTPMethod {
        switch self {
        case .fetchImages:
            return .get
        case .fetchQuoets:
            return .get
        }
    }
    
    // MARK: - PARAMETERS
    var parameters : Parameters? {
        switch self {
        case .fetchImages(searchKey: let searchKey):
            return [
                "key": "47312294-5f9b6042c846d4d3f861c610e",
                "q": searchKey
            ]
        case .fetchQuoets:
            return nil
        }
    }
    
    // This method Generates URLRequest Object based on the Properties of Confroming types in our case ApiRouters Enum!!
    func asURLRequest() throws -> URLRequest {
        // Construct the URL
        guard let url = URL(string: baseUrl) else { throw AFError.invalidURL(url: baseUrl) }
        
        // Create URL Request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        // Encode parameters
        if let parameters = parameters {
                  switch method {
                  case .get:
                      // Add parameters as query items for GET requests
                      urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
                  default:
                      // Add parameters in the body for other HTTP methods
                      urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
                  }
              }
        return urlRequest
    }
}
