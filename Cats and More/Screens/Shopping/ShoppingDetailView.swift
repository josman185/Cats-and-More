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
        VStack(spacing: 20) {
            HStack {
                Text("\(item.category)")
                Spacer()
                Image(systemName: "star.lefthalf.fill")
                Text("\(item.rating, specifier: "%.1f")")
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .padding()
            
            Text("\(item.title)")
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            
            ItemRemoteImage(urlString: item.images.first!)
                .scaledToFit()
                .frame(height:150)
                .cornerRadius(12)
            
            Text("\(item.discountPercentage, specifier: "%.1f")% OFF")
                .font(.headline)
            
            Text("\(item.description)")
                .font(.subheadline)
                .padding()
            
            Spacer()
            
            Button("$ \(item.price, specifier: "%.2f")") {
                
            }
            .bold()
            .font(.title2)
            .frame(width: 280, height: 50)
            .background(Color.brandPrimaryColor)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding(20)
    }
}

struct ShoppingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingDetailView(item: MockData.sampleItem)
    }
}
