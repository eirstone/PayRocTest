//
//  Card.swift
//  PaymentLib
//
//  Created by Lei Zhang on 01/10/2022.
//

import Foundation

class Card {
    var ksn: String
    var payloadType: String
    var name: String?
    var sn: String?
    var encryptedData: String?
    var tags: [String: String]
    
    init() {
        ksn = ""
        payloadType = ""
        tags = [String: String]()
    }
    
    enum Keys: String {
        case ksn            = "dataKsn"
        case payloadType    = "payloadType"
        case name           = "cardholdername"
        case sn             = "serialNumber"
        case encryptedData  = "encryptedData"
        case tags           = "tags"
        
        var value: String {
            return self.rawValue
        }
    }
}

extension Card: XmlObj {
    static var nodeName: String {
        return "card"
    }

    func setText(key: String, value: String) {
        switch key {
        case Keys.ksn.value:
            ksn = value
        case Keys.payloadType.value:
            payloadType = value
        case Keys.name.value:
            name = value
        case Keys.sn.value:
            sn = value
        case Keys.encryptedData.value:
            encryptedData = value
        default:
            break
        }
    }
    
    func setTags(key: String, value: [String : String]) {
        switch key {
        case Keys.tags.value:
            value.forEach { (key: String, value: String) in
                tags[key] = value
            }
        default:
            break
        }
    }
}
