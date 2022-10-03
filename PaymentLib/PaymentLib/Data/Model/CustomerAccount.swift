//
//  CustomerAccount.swift
//  PaymentLib
//
//  Created by Lei Zhang on 02/10/2022.
//

import Foundation

struct CustomerAccount: Codable {
    let device: Device
    let tlv: String
    let payloadType: String
    
    let cardType: String
    let cardholderName: String
    let maskedPan: String
    let expiryDate: String
    let entryMethod: String
}
