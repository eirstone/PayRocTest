//
//  PaymentLib.swift
//  PaymentLib
//
//  Created by Lei Zhang on 01/10/2022.
//

import Foundation

public struct PaymentLib {
    
    public static func getDataFile() -> String {
        return "testfile"
    }
    
    /// Select a random card from the 'card_data' xml file
    public static func getRandomCard() throws -> Card {
        // Read content from "card_data" xml file
        guard let bundle = Bundle(identifier: "ie.leizhang.payroc.PaymentLib"),
              let path =  bundle.path(forResource: "card_data", ofType: "xml"),
              let data = try? Data(contentsOf: URL(string: "file://\(path)")!) else {
            print("The card_data.xml does not exist")
            throw PaymentError.card_not_found
        }
        
        let parser = PayRocXmlParser<Card>(data: data)
        let cards: [Card] = parser.parse()
        
        let index = Int.random(in: 0..<cards.count)
        return cards[index]
    }
}
