//
//  ShoppingDetailView.swift
//  Cats and More
//
//  Created by Jose Vargas on 6/5/24.
//

import SwiftUI

struct ShoppingDetailView: View {
    
    var item: Item
    
    var body: some View {
        VStack(alignment: .center, spacing: 35) {
            HStack {
                Text("\(item.category)")
                Spacer()
                Image(systemName: "star.lefthalf.fill")
                Text("\(item.rating, specifier: "%.2f")")
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
            
            Text("\(item.title)")
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            
            ItemRemoteImage(urlString: item.images.first!)
                .scaledToFit()
                .frame(height:150)
                .cornerRadius(12)
            
            HStack(spacing: 50) {
                Text("$\(item.price, specifier: "%.2f")")
                    .font(.headline)
                Text("\(item.discountPercentage, specifier: "%.1f") % OFF")
                    .font(.caption)
            }
            
            Text("\(item.description)")
                .font(.subheadline)
                .padding()
        }
        .padding(20)
    }
}

struct ShoppingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingDetailView(item: MockData.sampleItem)
    }
}
