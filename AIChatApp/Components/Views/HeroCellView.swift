//
//  HeroCellView.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 12/14/25.
//

import SwiftUI

/*
 This cell is built out so as to be reuseable in terms of data
 A frame will not be placed on it. Instead it will be placed at the time
 it is going to be used..
 */
struct HeroCellView: View {

    // The Hero cell, which is the first cell you see on Home View
    // for this app, is the Explore Tab View.
    // The Hero Cell has an image, a title and a subtitle
    // We make all of these optional because we may not want
    // all of these when we make this reusable for another part of
    // our app or another app.
    var title: String? = "This is some title"
    var subTitle: String? = "This is some subTitle that goes here"
    var imageName: String? = Constants.randomImageString

    var body: some View {
        ZStack {
            if let imageName {
                ImageLoaderView(urlString: imageName)
            } else {
                Rectangle()
                    .fill(.accent)
            }
        }
        .overlay(
            // overlayed text will be aligned on bottom, leading side (left)
            alignment: .bottomLeading,
            content: {
                VStack(alignment: .leading, spacing: 4) {
                    if let title {
                        Text(title)
                            .font(.headline)
                    }
                    if let subTitle {
                        Text(subTitle)
                            .font(.subheadline)
                    }
                }
                // use white text when placing text on an image
                .foregroundStyle(.white)
                .padding(16)
                // to make the text really pop we can create a linear gradient
                // using one base color often looks the best
                .frame(maxWidth: .infinity, alignment: .leading)// pushes gradient to the edge
                // places a linear gradient in the background of the VStack that
                // contains the Text title and subtitle
                .background(
                    LinearGradient(
                        colors: [
                            Color.black.opacity(0),
                            Color.black.opacity(0.3),
                            Color.black.opacity(0.4)
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                )
            })
        .cornerRadius(16)
    }
}

// When creating a reusable component, it is good to put several examples
// so other developers can see how it is used
#Preview {
    ScrollView {
        VStack {
            HeroCellView()
                .frame(width: 300, height: 200)
            HeroCellView()
                .frame(width: 300, height: 400)
            HeroCellView()
                .frame(width: 200, height: 400)
            HeroCellView(imageName: nil)
                .frame(width: 300, height: 200)
            HeroCellView(title: nil)
                .frame(width: 300, height: 200)
            HeroCellView(subTitle: nil)
                .frame(width: 300, height: 200)
        }
        // placing the HeroCellViews in a VStack along with a
        // maxWidth frame set to .infinity places the scroll all
        // the way to the right edge
        .frame(maxWidth: .infinity)
    }

}
