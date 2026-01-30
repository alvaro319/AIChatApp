//
//  ImageLoaderView.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 10/23/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {

    /*
     if we define urlString and resizingContentMode to
     let constants then we can't modify what value they
     are set to at instantiation time.
     Purposely not setting to let constants because when
     we type out ImageLoaderView() to call the function,
     the initializer of this function will show the parameters
     String: urlString and ContentMode: resizingContentMode,
     which will allow us to pass values in
     */
    var urlString: String = Constants.randomImageString
    var resizingContentMode: ContentMode = .fill

    var body: some View {

        /*
         In the preview below, the frame is set to 100x200.
         The image resizes because of the modifiers .resizable()
         and the aspectRatio's resizingMode(contentMode). The image,
         however, is extending beyond the frame. So we want to
         clip the image to the frame, so the image won't extend
         */
        
        Rectangle()
            // don't need to draw the rectangle on the screen, we just
            // needed it as frame
            .opacity(0)
            // places on top or overlays the WebImage over the rectangle
            .overlay {
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingContentMode)
                    // when the ImageLoaderView() is clicked we want to make sure the
                    // any portion of the image extending beyond the frame isn't clickable
                    .allowsHitTesting(false)
            }
            .clipped()// clips the image to the frame of the rectangle

        // Alternate?
//        WebImage(url: URL(string: urlString))
//            .resizable()
//            .indicator(.activity)
//            .aspectRatio(contentMode: resizingContentMode)
//            .frame(width: 100, height: 200)
//            .clipShape(Rectangle())
//            .contentShape(Rectangle())
    }
}

#Preview {
    ImageLoaderView()
        .frame(width: 100, height: 200)
}
