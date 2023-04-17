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
            Color(.gray).ignoresSafeArea()

            ScrollView {
                Text("Courses".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)

                if !show {
                    CourseItem(namespace: namespace, show: $show)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.8)) {
                                show.toggle()
                                showStatusBar = false
                            }
                        }
                }
            }

            // You need to use this out of the ScrollView otherwise you will get cut by ScrollView boundaries
            if show {
                CourseView(namespace: namespace, show: $show)
            }
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation {
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
