//
//  ItemViewModel.swift
//  Cats and More
//
//  Created by Jose Vargas on 6/4/24.
//

import Foundation
final class ItemViewModel: ObservableObject {
    
    @Published var items: [Item] = []
    
    func getItems() {
        NetworkManager.shared.downloadItems { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.items = success
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}
