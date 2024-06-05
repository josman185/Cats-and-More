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
    let title, description, category: String
    let price, rating, discountPercentage: Double
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
                                 category: "beauty",
                                 price: 9.99,
                                 rating: 4.94, 
                                 discountPercentage: 7.17,
                                 images: ["https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png"],
                                 thumbnail: "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png")
    
    static let items = [sampleItem, sampleItem, sampleItem, sampleItem]
}
