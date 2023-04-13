//
//  MatchedViewTextWithColour.swift
//  MatchedViewTraining
//
//  Created by Antonio Palomba on 13/04/23.
//

import SwiftUI

struct MatchedViewTextWithColour: View {
    @Namespace var namespace
    @State var show = false

    var body: some View {
        ZStack {
            if !show {
                VStack {
                    Text("SwiftUI")
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "header", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("20 sections - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                }
                //When adding changes like colour with .matchedGeometry care because it will not be displayed in preview, ONLY IN SIMULATOR
                .foregroundColor(.white)
                .background(.red)
            } else {
                VStack {
                    Text("20 sections - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                    Text("SwiftUI")
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "header", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundColor(.black)
                .background(.blue)
            }
        }
        .onTapGesture {
            withAnimation {
                show.toggle()
            }
        }
    }
}

struct MatchedViewTextWithColour_Previews: PreviewProvider {
    static var previews: some View {
        MatchedViewTextWithColour()
    }
}
