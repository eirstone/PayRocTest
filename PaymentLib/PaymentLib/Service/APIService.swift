//
//  APIService.swift
//  PaymentLib
//
//  Created by Lei Zhang on 02/10/2022.
//

import Foundation
import Combine

protocol APIService {
    func makePayment(_ request: Data) -> AnyPublisher<PaymentResponse, Error>
}
