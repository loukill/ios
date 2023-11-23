//
//  ViewExtension.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import Foundation
import SwiftUI
import UIKit

extension View {
    func hideNavigationBar() -> some View {
        self
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
    }

    @ViewBuilder func visibility(_ visibility: ViewVisibility) -> some View {
        if visibility != .gone {
            if visibility == .visible {
                self
            } else {
                hidden()
            }
        }
    }
}


enum ViewVisibility: CaseIterable {
    case visible, // view is fully visible
         invisible, // view is hidden but takes up space
         gone // view is fully removed from the view hierarchy
}

