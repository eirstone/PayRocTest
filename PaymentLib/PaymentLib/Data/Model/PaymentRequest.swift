//
//  Request.swift
//  PaymentLib
//
//  Created by Lei Zhang on 02/10/2022.
//

import Foundation

struct PaymentRequest: Codable {
    let channel: String
    let terminal: String
    let order: Order
    let customerAccount: CustomerAccount
}
