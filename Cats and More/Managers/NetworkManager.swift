//
//  NetworkManager.swift
//  Cats and More
//
//  Created by Jose Vargas on 6/3/24.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString,UIImage>()
    
    private let baseURL = "https://dummyjson.com/products"
    
    private init() {}
    
    func downloadItems(completed: @escaping (Result<[Item], APIError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(Items.self, from: data)
                completed(.success(decodedResponse.products))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
