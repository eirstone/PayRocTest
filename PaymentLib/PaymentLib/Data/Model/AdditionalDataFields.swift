//
//  AdditionalDataFields.swift
//  PaymentLib
//
//  Created by Lei Zhang on 02/10/2022.
//

import Foundation

struct AdditionalDataFields: Decodable {
    let dataFields: [AdditionalDataField]
}

struct AdditionalDataField: Decodable {
    let name: String
    let value: String
}
