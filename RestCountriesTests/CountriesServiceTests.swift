//
//  ServiceTests.swift
//  RestCountriesTests
//
//  Created by Michael Bielodied on 12/1/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import XCTest
@testable import RestCountries

class CountriesServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCancelRequest() {
        
        // giving a "previous" session
        CountriesService.shared.fetchAllCountries { _, _ in
            // ignore call
        }

        // Expected to task nil after cancel
        CountriesService.shared.cancelFetchCurrencies()
        XCTAssertNil(CountriesService.shared.task, "Expected task nil")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
