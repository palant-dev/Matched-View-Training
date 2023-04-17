//
//  CourseView.swift
//  MatchedViewTraining
//
//  Created by Antonio Palomba on 17/04/23.
//

import SwiftUI

struct CourseView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool

    var body: some View {
        ZStack {
            ScrollView {
                cover
            }
            .background(.gray)
            .ignoresSafeArea()

            button
        }
    }

    var cover: some View {
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
            Image("Background5")
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

    var button: some View {
        Button {
            withAnimation(.closeCard) {
                show.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseView(namespace: namespace, show: .constant(true))
    }
}
