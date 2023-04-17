//
//  HomeView.swift
//  MatchedViewTraining
//
//  Created by Antonio Palomba on 17/04/23.
//

import SwiftUI

struct HomeView: View {
    @Namespace var namespace
    @State var show = false
    @State var showStatusBar = true

    var body: some View {
        ZStack {

            ScrollView {
                Text("HomeView")
                    .font(.largeTitle)
                Text("HomeView")
                    .font(.largeTitle)
                Text("HomeView")
                    .font(.largeTitle)
                Text("Courses".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)

                if !show {
                    CourseItem(namespace: namespace, show: $show)
                        .onTapGesture {
                            withAnimation(.openCard) {
                                show.toggle()
                                showStatusBar = false
                            }
                        }
                }
            }

            // You need to use this out of the ScrollView otherwise you will get cut by ScrollView boundaries
            if show {
                CourseView(namespace: namespace, show: $show)
                // In order to give an order of appearing/disappearing to the overlapping elements
                    .zIndex(1)
                // This is for assuring you that the fade is not played too late or too early
                    .transition(.asymmetric(insertion: .opacity.animation(.easeInOut(duration: 0.1)), removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))))
            }
        }
        // If you use the Color inside the ZStack it will break matchedGeometry
        .background(Color(.gray).ignoresSafeArea())
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showStatusBar = false
                } else {
                    showStatusBar = true
                }
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
