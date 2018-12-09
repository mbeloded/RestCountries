//
//  CountryTests.swift
//  RestCountriesTests
//
//  Created by Michael Bielodied on 12/8/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import XCTest
@testable import RestCountries

class CountryViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCountryModel() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let country = Country.init(name: "", alpha2Code: "", alpha3Code: "", capital: "", region: "", subregion: "", population: 1000, latlng: [], demonym: "", area: nil, borders: [""], nativeName: "", currencies: [Currency.init(code: nil, name: nil, symbol: nil)], languages: [Language.init(iso639_1: nil, iso639_2: "", name: "", nativeName: "")], flag: "")
        
        let countryViewModel = CountryViewModel.init(country: country)
        
        let url = URL(string: countryViewModel.flagImageUrl)
        
        // expected details
        XCTAssertTrue(countryViewModel.details.count > 0, "Expected at least one item indetails about the country")
        
        XCTAssertNotNil(url, "Expected valid flag URL of the country")
        
        let data = try? Data(contentsOf: url!)
        XCTAssertNotNil(data, "Expected flag data of the country")
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
