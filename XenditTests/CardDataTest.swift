//
//  CardDataTest.swift
//  Xendit
//
//  Created by Maxim Bolotov on 3/15/17.
//
//

import XCTest
@testable import Xendit

class CardDataTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: Test Create Card Data model
    
    func testCreateCardDataModel() {
        let card = CardData()
        card.cardNumber = "2323123112341234"
        card.cardExpMonth = "02"
        card.cardExpYear = "2017"
        card.cardCvn = "234"
        card.amount = 123
        
        XCTAssert(card.cardNumber != nil, "Missing cardNumber")
        XCTAssert(card.cardExpMonth != nil, "Missing cardExpMonth")
        XCTAssert(card.cardExpYear != nil, "Missing cardExpYear")
        XCTAssert(card.cardCvn != nil, "Missing cardCvn")
        XCTAssert(card.amount != nil, "Missing amount")
    }
    
    // MARK: Test Card Number Validation
    
    func testCardNumberValidationForValidVisaElectronCard() {
        testCardNumberValidationForValidCard(cardNumber: "4508083412341234", cardName: "VisaElectron")
    }
    
    func testCardNumberValidationForValidVisaCard() {
        testCardNumberValidationForValidCard(cardNumber: "4045083412341234", cardName: "Visa")
    }
    
    func testCardNumberValidationForInvalidVisaCard() {
        testCardNumberValidationForInvalidCard(cardNumber: "2045083412341234", cardName: "Visa")
    }
    
    func testCardNumberForValidAmex() {
        testCardNumberValidationForValidCard(cardNumber: "3726123412341234", cardName: "Amex")
    }
    
    func testCardNumberForInvalidAmex() {
        testCardNumberValidationForInvalidCard(cardNumber: "3526123412341234", cardName: "Amex")
    }
    
    func testCardNumberValidationForValidMasterCard() {
        testCardNumberValidationForValidCard(cardNumber: "5191381132754906", cardName: "MasterCard")
    }
    
    func testCardNumberValidationForInvalidMasterCard() {
        testCardNumberValidationForInvalidCard(cardNumber: "7026123412341234", cardName: "MasterCard")
    }
    
    func testCardNumberValidationForValidDiscoverCard() {
        testCardNumberValidationForValidCard(cardNumber: "62292023412341647", cardName: "Discover")
    }
    
    func testCardNumberValidationForInvalidDiscoverCard() {
        testCardNumberValidationForInvalidCard(cardNumber: "2221123412341647", cardName: "Discover")
    }
    
    func testCardNumberValidationForValidJBCCard() {
        testCardNumberValidationForValidCard(cardNumber: "3528123412341647", cardName: "JBC")
    }
    
    func testCardNumberValidationForInvalidJBCCard() {
        testCardNumberValidationForInvalidCard(cardNumber: "3520123412341647", cardName: "JBC")
    }
    
    func testCardNumberValidationForValidDankortCard() {
        testCardNumberValidationForValidCard(cardNumber: "5019123412341647", cardName: "Dankort")
    }
    
    func testCardNumberValidationForInvalidDankortCard() {
        testCardNumberValidationForInvalidCard(cardNumber: "3520123412341647", cardName: "Dankort")
    }
    
    func testCardNumberValidationForValidMaestro() {
        testCardNumberValidationForValidCard(cardNumber: "5020123412341647", cardName: "Maestro")
    }
    
    func testCardNumberValidationForInvalidMaestro() {
        testCardNumberValidationForInvalidCard(cardNumber: "1120123412341647", cardName: "Maestro")
    }
    
    func testCardNumberValidationForValidCard(cardNumber: String, cardName: String) {
        let result = Xendit.isCardNumberValid(cardNumber: cardNumber)
        let message = String(format:"Invalid %@ Card Number", cardName)
        XCTAssert(result == true, message)
    }
    
    func testCardNumberValidationForInvalidCard(cardNumber: String, cardName: String) {
        let result = Xendit.isCardNumberValid(cardNumber: cardNumber)
        let message = String(format:"Test is failed with %@ Card Number", cardName)
        XCTAssert(result == false, message)
    }
    
    // MARK: Test Card Expiration Validation
    
    func testCardExpirationValid() {
        let result = Xendit.isExpiryValid(cardExpirationMonth: "12", cardExpirationYear: "2020")
        XCTAssert(result == true, "Failed testing card expiration date for valid case")
    }
    
    func testCardExpirationInvalid() {
        let result = Xendit.isExpiryValid(cardExpirationMonth: "0111", cardExpirationYear: "2016")
        XCTAssert(result == false, "Failed testing card expiration date for invalid case")
    }
    
    // MARK: Test Card CVN Validation
    
    func testCardCVNValid() {
        let result = Xendit.isCvnValid(creditCardCVN: "122")
        XCTAssert(result == true, "Failed testing card cvn for valid case")
    }
    
    func testCardCVNInvalid() {
        let result = Xendit.isCvnValid(creditCardCVN: "12344")
        XCTAssert(result == false, "Failed testing card cvn for invalid case")
    }
    
}
