//
//  ItemViewModel.swift
//  Cats and More
//
//  Created by Jose Vargas on 6/4/24.
//

import SwiftUI

final class ItemViewModel: ObservableObject {
    
    @Published var items: [Item] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    private let networkingManager: NetworkManagerImpl!
    
    init(networkingManager: NetworkManagerImpl = NetworkService()) {
        self.networkingManager = networkingManager
    }
    
    func getItems() {
        isLoading = true
        networkingManager.downloadItems { [self] result in
            guaranteeMainThread { [self] in
                isLoading = false
                switch result {
                case .success(let success):
                    self.items = success
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
