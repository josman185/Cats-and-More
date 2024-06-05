//
//  CustomError.swift
//  Cats and More
//
//  Created by Jose Vargas on 6/3/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
