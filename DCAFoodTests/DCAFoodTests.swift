//
//  DCAFoodTests.swift
//  DCAFoodTests
//
//  Created by jobzella on 11/03/2023.
//

import XCTest
@testable import DCAFood

final class DCAFoodTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testReachToTableBottom(){
        var sut = GamesViewModel()

        let isReached = sut.isReachTheBottom(total: 100, index: 99)
        XCTAssertEqual(isReached, true, "pagination working smoothly")

    }
    func testGenres(){
        var sut = GamesViewModel()
        let genres = [GameGenre(name: "action"),
                      GameGenre(name: "comedy"),
                      GameGenre(name: "none")
        ]
        let names = sut.getGenresNamesFrom(genres: genres)
        
        XCTAssertNotEqual(names, "action,comedy,none", "naming not correct")
        XCTAssertEqual(names, "action, comedy, none", "naming is correct")

    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
