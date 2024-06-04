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
    
    func getItems() {
        NetworkManager.shared.downloadItems { result in
            DispatchQueue.main.async { [self] in
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
