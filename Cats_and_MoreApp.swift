//
//  Cats_and_MoreApp.swift
//  Cats and More
//
//  Created by Jose Vargas on 6/3/24.
//

import SwiftUI

@main
struct Cats_and_MoreApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabBarView()
        }
    }
}

func guaranteeMainThread(_ work: @escaping () -> Void) {
    if Thread.isMainThread {
        work()
    } else {
        DispatchQueue.main.async(execute: work)
    }
}
