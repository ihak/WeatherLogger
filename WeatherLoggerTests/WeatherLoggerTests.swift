//
//  WeatherLoggerTests.swift
//  WeatherLoggerTests
//
//  Created by Hassan Ahmed on 02/03/2020.
//  Copyright © 2020 Arpatech Pvt. Ltd. All rights reserved.
//

import XCTest
@testable import WeatherLogger

class WeatherLoggerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetWeatherWithCityName() {
        let cityName = "Karachi"
        let expectation = self.expectation(description: "Get City Weather")
        
        APIClient.getWeather(with: cityName) { (result, error) in
            XCTAssertNotNil(result, error?.localizedDescription ?? "No data found")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 120.0)
    }

    func testGetWeatherWithLatLon() {
        let lat = "67.08"
        let lon = "24.91"
        let expectation = self.expectation(description: "Get City Weather with Lat Lon")
        
        APIClient.getWeather(with: lat, lon: lon) { (result, error) in
            XCTAssertNotNil(result, error?.localizedDescription ?? "No data found")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 120.0)
    }
}
