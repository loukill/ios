//
//  SideBarView.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import SwiftUI

struct SideBarView: View {
    @State private var isSidebarOpened = false
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<8) { _ in
                    AsyncImage(
                        url: URL(
                            string: "https://picsum.photos/600"
                        )) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 240)
                        } placeholder: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.gray.opacity(0.6))
                                    .frame(height: 240)
                                ProgressView()
                            }
                        }
                        .aspectRatio(3 / 2, contentMode: .fill)
                        .cornerRadius(12)
                        .padding(.vertical)
                        .shadow(radius: 4)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    SideBarView()
}
