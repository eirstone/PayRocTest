//
//  EmvTags.swift
//  PaymentLib
//
//  Created by Lei Zhang on 03/10/2022.
//

import Foundation

struct EmvTags: Decodable {
    let tags: [EmvTag]
}


struct EmvTag: Decodable {
    let hex: String
    let value: String
}
