//
//  UnitTestsExerciseTests.swift
//  UnitTestsExerciseTests
//
//  Created by Magno on 4/05/23.
//

import XCTest
@testable import UnitTestsExercise

final class UnitTestsExerciseTests: XCTestCase {
    func test_calculateTotal_salesTaxTwentyPercent() {
        let items = [
            CheckoutItem(name: "Fish and Chips", price: 625),
            CheckoutItem(name: "Chips", price: 145),
            CheckoutItem(name: "Lasagna", price: 425)
        ]
        
        let taxPercentage = 20
        let totalToPay = calculateTotal(items: items, localTaxPercent: taxPercentage)
        XCTAssertEqual(totalToPay, 1434)
    }

}
