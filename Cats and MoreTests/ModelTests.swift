//
//  Cats_and_MoreTests.swift
//  Cats and MoreTests
//
//  Created by Jose Vargas on 6/3/24.
//

import XCTest
@testable import Cats_and_More

final class ModelTests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    func testItemModel_CanCreateInstance() {
        let instance = Item(id: 1,
                            title: "Essence Mascara Lash Princess",
                            description: "The Essence Mascara Lash Princess is a popular mascara.",
                            category: "beauty",
                            price: 9.99,
                            rating: 4.94,
                            discountPercentage: 7.17,
                            images: ["https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png"],
                            thumbnail: "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png")
        XCTAssertNotNil(instance)
    }
}
