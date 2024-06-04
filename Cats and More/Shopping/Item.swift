//
//  Item.swift
//  Cats and More
//
//  Created by Jose Vargas on 6/3/24.
//

import Foundation

// MARK: - Product
struct Item: Decodable, Identifiable {
    let id: Int
    let title, description: String
    let price: Double
    let images: [String]
    let thumbnail: String
}

struct Items: Decodable {
    let products: [Item]
    let total: Int
}

struct MockData {
    static let sampleItem = Item(id: 1,
                           title: "Essence Mascara Lash Princess",
                           description: "The Essence Mascara Lash Princess is a popular mascara.",
                           price: 9.99,
                           images: ["https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png"],
                           thumbnail: "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png")
    
    static let items = [sampleItem, sampleItem, sampleItem, sampleItem]
}
