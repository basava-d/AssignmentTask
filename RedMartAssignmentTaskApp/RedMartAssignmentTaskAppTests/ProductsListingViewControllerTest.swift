//
//  ProductsListingViewControllerTest.swift
//  RedMartAssignmentTaskAppTests
//
//  Created by Basavaraj on 07/08/18.
//  Copyright © 2018 Basavaraj D. All rights reserved.
//

import XCTest
@testable import RedMartAssignmentTaskApp

class ProductsListingViewControllerTest: XCTestCase {
    var model: ProductsListModel?
    var previousCategories : [Categories] = []
    var products: [Products] = []
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        let newProduct = Products(JSONString: "")
//        products.append(newProduct!)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        model = nil
        previousCategories = []
        products = []
        
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
       
        let count: Int = 0
        
        XCTAssertTrue(products.count >= count)
    }
    
}
