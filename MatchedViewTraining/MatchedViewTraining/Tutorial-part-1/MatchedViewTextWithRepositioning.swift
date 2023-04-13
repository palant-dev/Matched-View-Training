//
//  MatchedViewTextWithRepositioning.swift
//  MatchedViewTraining
//
//  Created by Antonio Palomba on 13/04/23.
//

import SwiftUI

struct MatchedViewTextWithRepositioning: View {
    @Namespace var namespace
    @State var show = false

    var body: some View {
        ZStack {
            if !show {
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
                // When adding changes like colour with .matchedGeometry care because it will not be displayed in preview, ONLY IN SIMULATOR
                .foregroundColor(.white)
                .background(
                    Color.red
                    // In general everything that uses a different style should own a personal .matchedGeometryEffect()
                        .matchedGeometryEffect(id: "background", in: namespace)
                )
                .padding(20)
            } else {
                VStack(alignment: .leading, spacing: 12) {
                    // When we add a spacer the .background() will have to change so much that we will lose the .matchedGeometryEffect()
                    Spacer()
                    Text("Build an iOS app for iOS 15 with custom layouts, animations and...")
                        .font(.footnote)
                        .matchedGeometryEffect(id: "text", in: namespace)
                    Text("20 sections - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                    Text("SwiftUI")
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "header", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(20)
                .foregroundColor(.black)
                // In order to use the .matchedGeometryEffect() with a changing dimension background we need to use a specific id
                .background(
                    Color.blue
                        .matchedGeometryEffect(id: "background", in: namespace)
                )
            }
        }
        .onTapGesture {
            withAnimation (.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
    }
}

struct MatchedViewTextWithRepositioning_Previews: PreviewProvider {
    static var previews: some View {
        MatchedViewTextWithRepositioning()
    }
}
