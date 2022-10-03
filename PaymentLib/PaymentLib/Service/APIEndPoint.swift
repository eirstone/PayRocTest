//
//  APIEndPointService.swift
//  PaymentLib
//
//  Created by Lei Zhang on 02/10/2022.
//

import Foundation

protocol EndPoint {
    var scheme: String{ get }
    var host: String { get }
    var path: String { get }
    var requestHttpMethod : String { get }
    var contentType: String { get }
    
    /// Body parameters attached to the request, used in post requests
    var requestData: Data? { get }

    /// Creates a `URLRequest` from the selected case, applying standard headers in the default case
    func toURLRequest() throws -> URLRequest
}

extension EndPoint{
    private var urlComponent: URLComponents {
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        
        return component
    }
    
    func toURLRequest() throws -> URLRequest{
        guard let url = urlComponent.url else {
            throw URLError(.badURL)
        }
        
        let apiKey = "14c7974ba5b38d0dbcb7a0d8bdf3959e3b316a812ab3815db17878719f50c0ce8da30b7c1690ba5698ce2ae3a714047052b389b3d7401dbb457fcc7abdac3ffd"
        let authorization = "Basic <Merchant \(apiKey)>"
        
        var request = URLRequest(url: url)
        request.addValue(contentType, forHTTPHeaderField: "Content-Type")
        request.addValue(authorization, forHTTPHeaderField: "Authorization")
        
        if let data = requestData {
            request.httpBody = data
        }
        request.httpMethod = requestHttpMethod
        print("request url=\(url)")
        print("request headers: \(request.allHTTPHeaderFields!)")
        
        return request
    }
}


