//
//  ShoppingView.swift
//  Cats and More
//
//  Created by Jose Vargas on 6/3/24.
//

import SwiftUI

struct ShoppingView: View {
    
    @StateObject var viewModel = ItemViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.items) { item in
                ItemCell(item: item)
            }
            .navigationTitle("Shopping")
        }
        .onAppear {
            viewModel.getItems()
        }
    }
}

struct ShoppingView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingView()
    }
}
