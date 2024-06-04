//
//  ShoppingView.swift
//  Cats and More
//
//  Created by Jose Vargas on 6/3/24.
//

import SwiftUI

struct ShoppingView: View {
    var body: some View {
        NavigationView {
            List(MockData.items) { item in
                ItemCell(item: item)
            }
            .navigationTitle("Shopping")
        }
    }
}

struct ShoppingView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingView()
    }
}
