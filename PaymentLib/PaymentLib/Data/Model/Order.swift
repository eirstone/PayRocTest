//
//  Order.swift
//  PaymentLib
//
//  Created by Lei Zhang on 02/10/2022.
//

import Foundation

struct Order: Codable {
    let orderId: String?
    let currenty: String?
    let totalAmount: Double?
    let orderBreakdown: OrderBreakdown?
}

struct OrderBreakdown: Codable {
    let subtotalAmount: Double
}
