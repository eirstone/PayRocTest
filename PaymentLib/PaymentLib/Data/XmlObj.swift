//
//  XmlObj.swift
//  PaymentLib
//
//  Created by Lei Zhang on 01/10/2022.
//

import Foundation

protocol XmlObj {
    static var nodeName: String { get }
    func setText(key: String, value: String)
    func setTags(key: String, value: [String: String])
}
