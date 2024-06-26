//
//  NetworkManager.swift
//  Cats and More
//
//  Created by Jose Vargas on 6/3/24.
//

import UIKit

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString,UIImage>()
    
    private let baseURL = "https://dummyjson.com/products"
    
    private init() {}
    
    func downloadItems(completed: @escaping (Result<[Item], APIError>) -> Void) {
        guard let url = URL(string: baseURL) else 
        {
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
    
    func downloadThumbnail(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, _ in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}

protocol NetworkManagerImpl {
    func downloadItems(completed: @escaping (Result<[Item], APIError>) -> Void)
}

class NetworkService: NetworkManagerImpl {
    func downloadItems(completed: @escaping (Result<[Item], APIError>) -> Void) {
        NetworkManager.shared.downloadItems(completed: completed)
    }
}
