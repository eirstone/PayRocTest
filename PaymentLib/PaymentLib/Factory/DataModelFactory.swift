//
//  DataModelFactory.swift
//  PaymentLib
//
//  Created by Lei Zhang on 01/10/2022.
//

import Foundation

struct DataModelFactory {
    static func create<T>(type: T.Type) -> XmlObj? {
        if type == Card.self {
            return Card()
        }
        
        return nil
    }
}
