//
//  MatchedViewText.swift
//  MatchedViewTraining
//
//  Created by Antonio Palomba on 13/04/23.
//

import SwiftUI

struct MatchedViewText: View {
    @Namespace var namespace
    @State var show = false

    var body: some View {
        ZStack {
            // In this case we are going to use !show in order to have first the not active animetion contained in the first part of the if-conditional and then in the else the second part of the animation. But it's a matter of personal preferences
            if !show {
                Text("SwiftUI")
                //Attention to the modifier stack, if you put this after .frame() will not work
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                Text("SwiftUI")
                //Also care for the formatting of the element because if we change the style this wont work
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .onTapGesture {
            withAnimation {
                show.toggle()
            }
        }
    }
}

struct MatchedViewText_Previews: PreviewProvider {
    static var previews: some View {
        MatchedViewText()
    }
}
