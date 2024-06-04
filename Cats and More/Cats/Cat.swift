//
//  Cat.swift
//  Cats and More
//
//  Created by Jose Vargas on 6/3/24.
//

import Foundation

struct Cat {
    // [{"_id":"UWLKu2HjSdGAnAnb","mimetype":"image/jpeg","size":43567,"tags":["White","comfy","cute","sleeping"]}
    let _id, mimetype: String
    let size: Int
    let tags: [String]
}

struct CatsMockData {
    static let sampleCat = Cat(_id: "UWLKu2HjSdGAnAnb",
                               mimetype: "image/jpeg",
                               size: 43567,
                               tags: ["White","comfy","cute","sleeping"])
    
    static let cats = [sampleCat,sampleCat,sampleCat,sampleCat]
}
