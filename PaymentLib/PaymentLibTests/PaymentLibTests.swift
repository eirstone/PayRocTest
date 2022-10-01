//
//  PaymentLibTests.swift
//  PaymentLibTests
//
//  Created by Lei Zhang on 01/10/2022.
//

import XCTest
@testable import PaymentLib

class PaymentLibTests: XCTestCase {

    private var sut: PayRocXmlParser<Card>!
    
    override func setUpWithError() throws {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.path(forResource: "cardDataMock", ofType: "xml") else {
            print("The mock data is not found at the bundle")
            return
        }
        
        let dataUrl = URL(string: "file://\(url)")
        if let data = try? Data(contentsOf: dataUrl!) {
            sut = PayRocXmlParser<Card>(data: data)
        }
        else {
            XCTFail("The XML data not found at specified url")
        }
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testXMLReader() throws {
        // Parsing
        let cards: [Card] = sut.parse()
        
        // Should be two cards in XML
        XCTAssertTrue(cards.count == 2)
        
        // Test first card
        XCTAssert(cards[0].ksn == "f8765432110000000080")
        XCTAssert(cards[0].payloadType == "EMV")
        XCTAssert(cards[0].tags["8c"] == "9f02069f03069f1a0295055f2a029a039c019f37049f35019f45029f4c089f34039f21039f7c14")
        XCTAssertTrue(cards[0].tags.count == 52)
        
        // Test second card
        XCTAssert(cards[1].ksn == "F876543211000000007B")
        XCTAssert(cards[1].name == "Test Card Swipe")
        XCTAssert(cards[1].sn == "1850010868")
        XCTAssert(cards[1].encryptedData == "FAF2A7467873C0ED88F54ED8299F1CCB885919E6487EB8D3E586C34BA84A5E27F689FA97ECA9BA04")
        XCTAssert(cards[1].payloadType == "MAG_STRIPE")
    }

}
