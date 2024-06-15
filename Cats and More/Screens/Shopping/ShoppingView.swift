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
        ZStack {
            NavigationView {
                List(viewModel.items) { item in
                    NavigationLink(destination: ShoppingDetailView(item: item)) {
                        ItemCell(item: item)
                    }
                }
                .navigationTitle("Shopping")
                .accessibilityIdentifier("ShoppingTableViewId")
            }
            .onAppear {
                viewModel.getItems()
            }
            
            if viewModel.isLoading {
                ActivityIndicator()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct ShoppingView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingView()
    }
}
