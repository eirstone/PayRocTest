//
//  WebService.swift
//  PaymentLib
//
//  Created by Lei Zhang on 02/10/2022.
//

import Foundation
import Combine

class WebService: APIService {
    func makePayment(_ request: Data) -> AnyPublisher<PaymentResponse, Error> {
        guard let request = try? PaymentEndPoint.makePayment(request).toURLRequest() else {
            print("Request is nil")
            fatalError()
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: PaymentResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
