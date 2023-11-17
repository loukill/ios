//
//  Product.swift
//  Furniture_app
//
//  Created by mohamed loukil on 15/11/2023.
//

import Foundation
import SwiftUI

struct Product {
    let imageName: String
    let title: String
    let destinationView: AnyView?

    init(imageName: String, title: String, destinationView: AnyView? = nil) {
        self.imageName = imageName
        self.title = title
        self.destinationView = destinationView
    }
}
