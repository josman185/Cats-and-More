//
//  ContentView.swift
//  Cats and More
//
//  Created by Jose Vargas on 6/3/24.
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        TabView {
            ShoppingView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Shopping")
                }
            CatsView()
                .tabItem {
                    Image(systemName: "tortoise")
                    Text("Animals")
                }
        }
        .accentColor(Color("brandPrimary"))
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
