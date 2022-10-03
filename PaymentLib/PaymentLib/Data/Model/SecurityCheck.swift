//
//  SecurityCheck.swift
//  PaymentLib
//
//  Created by Lei Zhang on 02/10/2022.
//

import Foundation

struct SecurityCheck: Decodable {
    let cvvResult: String
    let avsResult: String
}
