//
//  PaymentEndPoint.swift
//  PaymentLib
//
//  Created by Lei Zhang on 02/10/2022.
//

import Foundation

enum PaymentEndPoint {
    // Make Payment
    case makePayment(Data)
}

extension PaymentEndPoint : EndPoint{
    var requestData: Data? {
        switch self {
        case .makePayment(let data):
            return data
        }
    }
    
    var requestHttpMethod: String {
        return "POST"
    }
    
    var contentType: String {
        return "application/json"
    }

    var scheme: String{
        return "https"
    }

    var host: String {
        return "testpayments.worldnettps.com/merchant/api/v1"
    }

    var path: String {
        switch self {
        case .makePayment(_):
            return "/transaction/payments"
        }
    }
}
