//
//  TransactionResult.swift
//  PaymentLib
//
//  Created by Lei Zhang on 02/10/2022.
//

import Foundation

struct TransactionResult: Decodable {
    let type: String
    let status: String
    let approvalCode: String
    let dateTime: String
    let currency: String
    let authorizedAmount: Double
    let resultCode: String
    let resultMessage: String
    let storedPaymentCredentials: StoredPaymentCredentials
}

struct StoredPaymentCredentials: Decodable {
    let terminal: String
    let merchantReference: String
    let cardholderName: String
    let credentialsNumber: String
    let maskedPan: String
    let securityCheck: String
}
