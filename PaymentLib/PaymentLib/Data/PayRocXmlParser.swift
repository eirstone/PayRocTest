//
//  PayRocXmlParser.swift
//  PaymentLib
//
//  Created by Lei Zhang on 01/10/2022.
//

import Foundation

class PayRocXmlParser<T>:NSObject, XMLParserDelegate where T: XmlObj {
    private var xmlParser: XMLParser!
    private var parsedObjs = [T]()
    private var currentObj: T?
    private var xmlText = ""
    private var tagsDict: [String : String]?
    
    init(data: Data) {
        super.init()
        xmlParser = XMLParser(data: data)
    }
    
    func parse() -> [T] {
        xmlParser.delegate = self
        xmlParser.parse()
        return parsedObjs
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        xmlText = ""
        tagsDict = attributeDict
        if elementName == T.nodeName, let produced = DataModelFactory.create(type: T.self) as? T  {
            currentObj = produced
        }
    }
        
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if !xmlText.isEmpty {
            let value = xmlText.trimmingCharacters(in: .whitespacesAndNewlines)
            currentObj?.setText(key: elementName, value: value)
        }
        
        if let dict = tagsDict, !(dict.isEmpty), let dictK = dict["key"], let dictV = dict["value"]  {
            currentObj?.setTags(key: elementName, value: [dictK: dictV])
        }

        if elementName == T.nodeName {
            if let obj = currentObj {
                parsedObjs.append(obj)
            }
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String){
        xmlText += string
    }
}
