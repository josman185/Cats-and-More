//
//  NetworkingManagerResponseSuccessMock.swift
//  Cats and MoreTests
//
//  Created by Jose Vargas on 6/5/24.
//

import Foundation
@testable import Cats_and_More

class NetworkingManagerResponseSuccessMock: NetworkManagerImpl {
    
    var result: (Result<[Item], APIError>)!
    
    func downloadItems(completed: @escaping (Result<[Item], APIError>) -> Void) {
        completed(result)
    }
    
    func readLocalJsonFile() -> [Item]? {
        do {
            guard let fileUrl =  Bundle.main.url(forResource: "products", withExtension: "json") else {
                return nil
            }
            print(fileUrl)
            let data = try Data(contentsOf: fileUrl)
            print("\(data.count)")
            
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(Items.self, from: data)
            return (decodedResponse.products)
        } catch let error {
            print(String(describing: error))
            return nil
        }
    }
}
