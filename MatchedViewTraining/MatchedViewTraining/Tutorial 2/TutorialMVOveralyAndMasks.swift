//
//  TutorialMVOveralyAndMasks.swift
//  MatchedViewTraining
//
//  Created by Antonio Palomba on 13/04/23.
//

import SwiftUI

struct TutorialMVOveralyAndMasks: View {
    @Namespace var namespace
    @State var show = false

    var body: some View {
        ZStack {
            if !show {

                VStack {
                    Spacer()

                    VStack(alignment: .leading, spacing: 12) {
                        Text("SwiftUI")
                            .font(.largeTitle.weight(.bold))
                            .matchedGeometryEffect(id: "header", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)

                        Text("20 sections - 3 hours".uppercased())
                            .font(.footnote.weight(.semibold))
                            .matchedGeometryEffect(id: "subtitle", in: namespace)

                        Text("Build an iOS app for iOS 15 with custom layouts, animations and...")
                            .font(.footnote)
                            .matchedGeometryEffect(id: "text", in: namespace)
                    }
                    .padding(20)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(
                                RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .blur(radius: 30)
                            .matchedGeometryEffect(id: "blur", in: namespace)

                    )


                }

                .foregroundColor(.white)
                .background(
                    Image("Illustration 9")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "image", in: namespace)
                )
                .background(
                    Image("Background 5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "background", in: namespace)
                )
                .mask {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .matchedGeometryEffect(id: "mask", in: namespace)
                }
                .frame(height: 300)
                .padding(20)

            } else {
                ScrollView {
                    VStack {
                        Spacer()
                    }
                    // We use this .frame() because now the spacer will grant the maximum space only vertically, and the text is now inside the overlay modifier so it will not grant the maximum width anymore
                    .frame(maxWidth: .infinity)
                    .frame(height: 500)
                    .foregroundColor(.black)
                    .background(
                        Image("Illustration 9")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .matchedGeometryEffect(id: "image", in: namespace)
                    )
                    .background(
                        Image("Background 5")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: "background", in: namespace)
                    )
                    .mask {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .matchedGeometryEffect(id: "mask", in: namespace)
                    }
                    .overlay(
                        VStack(alignment: .leading, spacing: 12) {
                            Text("SwiftUI")
                                .font(.largeTitle.weight(.bold))
                                .matchedGeometryEffect(id: "header", in: namespace)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Text("20 sections - 3 hours".uppercased())
                                .font(.footnote.weight(.semibold))
                                .matchedGeometryEffect(id: "subtitle", in: namespace)

                            Text("Build an iOS app for iOS 15 with custom layouts, animations and...")
                                .font(.footnote)
                                .matchedGeometryEffect(id: "text", in: namespace)

                            Divider()

                            HStack {
                                Image(systemName: "person")
                                    .fontWeight(.bold)
                                    .padding(20)
                                    .background(
                                        .ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                                Text("Tought by Antonio Palomba")
                                    .font(.footnote)
                            }
                        }
                            .padding(20)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .mask(
                                        RoundedRectangle(cornerRadius: 30, style: .continuous))
                                    .matchedGeometryEffect(id: "blur", in: namespace)
                            )
                            .offset(y: 250)
                            .padding(20)
                    )
                }
            }
        }
        .onTapGesture {
            withAnimation (.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
    }
}

struct TutorialMVOveralyAndMasks_Previews: PreviewProvider {
    static var previews: some View {
        TutorialMVOveralyAndMasks()
    }
}
