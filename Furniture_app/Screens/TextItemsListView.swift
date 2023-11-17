//
//  TextItemsListView.swift
//  Furniture_app
//
//  Created by mohamed loukil on 17/11/2023.
//

import SwiftUI

struct TextItemsListView: View {
    var textItems: [TextItem]

    var body: some View {
        List(textItems) { item in
            NavigationLink(destination: TextDetailView(detailedText: item.detailedText)) {
                Text(item.title)
            }
        }
        .navigationTitle("Text Items")
    }
}

