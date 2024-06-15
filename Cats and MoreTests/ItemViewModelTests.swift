//
//  ViewModelTests.swift
//  Cats and MoreTests
//
//  Created by Jose Vargas on 6/5/24.
//

import XCTest
@testable import Cats_and_More

final class ItemViewModelTests: XCTestCase {
    
    private var networkingMock: NetworkingManagerResponseSuccessMock!
    private var vm: ItemViewModel!
    
    override func setUpWithError() throws {
        networkingMock = NetworkingManagerResponseSuccessMock()
        vm = ItemViewModel(networkingManager: networkingMock)
    }
    
    override func tearDownWithError() throws {
        networkingMock = nil
        vm = nil
    }
    
    func test_API_Failure() {
        networkingMock.result = .failure(.invalidData)
        vm.getItems()
        XCTAssert(vm.items.isEmpty, "ViewModel Data should be empty")
    }
    
    func test_API_invalidURL() {
        networkingMock.result = .failure(.invalidURL)
        vm.getItems()
        XCTAssert(vm.items.isEmpty, "ViewModel Data should be empty")
    }
    
    func test_API_invalidResponse() {
        networkingMock.result = .failure(.invalidResponse)
        vm.getItems()
        XCTAssert(vm.items.isEmpty, "ViewModel Data should be empty")
    }
    
    func test_API_unableToComplete() {
        networkingMock.result = .failure(.unableToComplete)
        vm.getItems()
        XCTAssert(vm.items.isEmpty, "ViewModel Data should be empty")
    }
    
    func test_API_Success() {
        
        XCTAssertFalse(vm.isLoading, "The ViewModel shouldn't be loading any data")
        defer {
            XCTAssertFalse(vm.isLoading, "The ViewModel shouldn't be loading any data")
        }
        
        guard let items = networkingMock.readLocalJsonFile() else { return }
        networkingMock.result = .success(items)
        
        vm.getItems()
        XCTAssert(!vm.items.isEmpty)
    }
}
