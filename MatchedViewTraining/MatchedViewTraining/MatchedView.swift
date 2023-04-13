//
//  MatchedView.swift
//  MatchedViewTraining
//
//  Created by Antonio Palomba on 13/04/23.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespeace
    @State var show = false

    var body: some View {
        ZStack {
            if !show {
                Text("SwiftUI")
                    .matchedGeometryEffect(id: "header", in: namespeace)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                Text("SwiftUI")
                    .matchedGeometryEffect(id: "header", in: namespeace)
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

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
