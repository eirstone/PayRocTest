//
//  Response.swift
//  PaymentLib
//
//  Created by Lei Zhang on 02/10/2022.
//

import Foundation

struct PaymentResponse: Decodable {
    let uniqueReference: String
    let terminal: String
    let order: Order
    let customerAccount: CustomerAccount
    let securityCheck: SecurityCheck
    let transactionResult: TransactionResult
    let additionalDataFields: AdditionalDataFields
    let emvTags: EmvTags
}
