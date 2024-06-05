//
//  RemoteImage.swift
//  Cats and More
//
//  Created by Jose Vargas on 6/5/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(from urlString: String) {
        NetworkManager.shared.downloadThumbnail(from: urlString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("catering-item-placeholder-704x520").resizable()
    }
}

struct ItemRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(from: urlString) }
    }
}
