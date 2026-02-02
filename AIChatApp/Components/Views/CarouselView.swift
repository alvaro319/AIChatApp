//
//  CarouselView.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 1/31/26.
//

// Module/TabBar Flow/ExploreView: CarouselView

import SwiftUI

// set up the frame of the carousel first
/*
struct CarouselView: View {

    var body: some View {
        ScrollView(.horizontal) {
            // We don't know how many images we will have in our carousel
            // but don't want to load all the images at once
            LazyHStack(spacing: 0) {
                ForEach(0..<50) { index in
                    Rectangle()
                        .fill(index % 2 == 0 ? Color.red : Color.blue)
                        .cornerRadius(20)
                        // color the even rectangels red, the odd ones blue
                        // using this just to see the different rectangles as we
                        // scroll

                        // allows us to page one rectangle at a time
                        .containerRelativeFrame(.horizontal, alignment: .center)

                }
            }
        }
        .frame(height: 200)
        .scrollIndicators(.hidden)
        .scrollTargetLayout()
        .scrollTargetBehavior(.paging)
    }
}
 */

// Now use the HeroCellView to display a carousel of mock AvatarModel
// objects
/*
struct CarouselView: View {

    // modify AvatarModel to conform to Hashable
    // and in the ForEach loop below add the parameter called
    // id: to be able to differentiate one item from another
    var items: [AvatarModel] = AvatarModel.mocks
    @State private var selection: AvatarModel?

    var body: some View {
        VStack(spacing: 12) {
            ScrollView(.horizontal) {
                // We don't know how many images we will have in our carousel
                // but don't want to load all the images at once
                LazyHStack(spacing: 0) {
                    ForEach(items, id: \.self) { item in
                        HeroCellView(
                            title: item.name,
                            subTitle: item.characterDescription,
                            imageName: item.profileImageName
                        )
                        .scrollTransition(.interactive.threshold(.visible(0.95))) { content, phase in
                            // the content is the cell
                            content
                            // content is an EmptyVisualEffect
                            // the scale of the content(the cell, that is)
                            // will be at 90% when off the screen
                            // and transitioning into view. Once in view
                            // on the screen, the scale will be at 100%
                            .scaleEffect(phase.isIdentity ? 1 : 0.9)
                        }
                        .cornerRadius(20)
                        // allows us to page one rectangle at a time
                        .containerRelativeFrame(.horizontal, alignment: .center)
                        // in order to 'select' an avatar model
                        // object (that is, one that is shown),
                        // we need to let it know the id of each cell.
                        // here we use the id modifier to let it know the item is going to
                        // be the hash value for each item.

                        // the object passed into .id() needs to match the .scrollPosition's
                        // parameter type below; the @State var 'selection' is of type AvatarModel
                        // The parameter 'item' here is also of type AvatarModel
                        .id(item)
                    }
                }
            }
            .frame(height: 200)
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
            // the id has to be a hashable binding, and an AvatarModel
            // object is of type AvatarModel that conforms to Hashable
            .scrollPosition(id: $selection)
            // right now, the AvatarModel objects shown are static because we are
            // currently using mock data. However, we have yet added code
            // to load real data, which can change the AvatarModel objects shown
            // whenever the AvatarModel Objects shown changes due to loading updated
            // modified data, then let's also update the first item selected
            .onChange(of: items.count, { _, _ in
                updateSelectionIfNeeded()
            })
            .onAppear {
                updateSelectionIfNeeded()
            }

            // displays the circles that let the user know which image is
            // currently being shown in the carousel of images
            HStack(spacing: 8) {
                ForEach(items, id: \.self) { item in
                    Circle()
                        .fill(item == selection ? .accent : .secondary )
                        .frame(width: 8, height: 8)

                }
            }
            .animation(.linear, value: selection)
        }
    }

    private func updateSelectionIfNeeded() {
        // when the CarouselView loads onAppear or when onChange due to new data
        // being loaded into the items array, there is either no image
        // 'selected' with respect to the circles that inform the user
        // which image they are currently seeing in the carousel or they
        // are currently on the last selected item, if either are true, then
        // reset it the 'selected' image in the carousel to the first one
        if selection == nil || selection == items.last {
            selection = items.first
        }
    }
}
 */

struct CarouselView<Content: View, T: Hashable>: View {

    var items: [T]
    // so rather than being a function that returns content,
    // let's make this a function that accepts an avatar model (T)
    // and returns content.
    @ViewBuilder var content: (T) -> Content
    @State private var selection: T?

    var body: some View {
        VStack(spacing: 12) {
            ScrollView(.horizontal) {
                // We don't know how many images we will have in our carousel
                // but don't want to load all the images at once
                LazyHStack(spacing: 0) {
                    ForEach(items, id: \.self) { item in
                        // pass in the avatarModel, that is, item, into the content
                        // this item gets passed into the closure, for example, as
                        // avatarModelItem in the Preview below
                        content(item)
//                        HeroCellView(
//                            title: item.name,
//                            subTitle: item.characterDescription,
//                            imageName: item.profileImageName
//                        )
                        .scrollTransition(.interactive.threshold(.visible(0.95))) { content, phase in
                            // the content is the cell
                            content
                            // content is an EmptyVisualEffect
                            // the scale of the content(the cell, that is)
                            // will be at 90% when off the screen
                            // and transitioning into view. Once in view
                            // on the screen, the scale will be at 100%
                            .scaleEffect(phase.isIdentity ? 1 : 0.9)
                        }
                        .cornerRadius(20)
                        // allows us to page one rectangle at a time
                        .containerRelativeFrame(.horizontal, alignment: .center)
                        // in order to 'select' an avatar model
                        // object (that is, one that is shown),
                        // we need to let it know the id of each cell.
                        // here we use the id modifier to let it know the item is going to
                        // be the hash value for each item.

                        // the object passed into .id() needs to match the .scrollPosition's
                        // parameter type below; the @State var 'selection' is of type AvatarModel
                        // The parameter 'item' here is also of type AvatarModel
                        .id(item)
                    }
                }
            }
            .frame(height: 200)
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
            // the id has to be a hashable binding, and an AvatarModel
            // object is of type AvatarModel that conforms to Hashable
            .scrollPosition(id: $selection)
            // right now, the AvatarModel objects shown are static because we are
            // currently using mock data. However, we have yet added code
            // to load real data, which can change the AvatarModel objects shown
            // whenever the AvatarModel Objects shown changes due to loading updated
            // modified data, then let's also update the first item selected
            .onChange(of: items.count, { _, _ in
                updateSelectionIfNeeded()
            })
            .onAppear {
                updateSelectionIfNeeded()
            }

            // displays the circles that let the user know which image is
            // currently being shown in the carousel of images
            HStack(spacing: 8) {
                ForEach(items, id: \.self) { item in
                    Circle()
                        .fill(item == selection ? .accent : .secondary )
                        .frame(width: 8, height: 8)

                }
            }
            .animation(.linear, value: selection)
        }
    }

    private func updateSelectionIfNeeded() {
        // when the CarouselView loads onAppear or when onChange due to new data
        // being loaded into the items array, there is either no image
        // 'selected' with respect to the circles that inform the user
        // which image they are currently seeing in the carousel or they
        // are currently on the last selected item, if either are true, then
        // reset it the 'selected' image in the carousel to the first one
        if selection == nil || selection == items.last {
            selection = items.first
        }
    }
}

#Preview {

    // HeroCellView is the content we pass into the ViewBuilder var content
    // property
    CarouselView(items: AvatarModel.mocks) { avatarModelItem in
        HeroCellView(
            title: avatarModelItem.name,
            subTitle: avatarModelItem.characterDescription,
            imageName: avatarModelItem.profileImageName
        )
    }

//    CarouselView(
//        content:
//            HeroCellView(
//                    title: AvatarModel.mock.name,
//                    subTitle: AvatarModel.mock.characterDescription,
//                    imageName: AvatarModel.mock.profileImageName
//                    ),
//        items: AvatarModel.mocks
//    )
    // since this will be a reusable component, we won't add any padding()
    // inside component but we add it
    // in the preview to see what it will look like
    .padding(15)
}
