//
//  NavigationConfigurator.swift
//  forum-app
//
//  Created by macbook on 23/11/2023.
//

import SwiftUI

struct NavigationConfigurator: ViewModifier {
    var configure: (UINavigationController) -> Void

    init(configure: @escaping (UINavigationController) -> Void) {
        self.configure = configure
    }

    func body(content: Content) -> some View {
        content.onAppear {
            // Get the UINavigationController from the SwiftUI view
            if let navigationController = UIApplication.shared.windows.first?.rootViewController?.children.first as? UINavigationController {
                self.configure(navigationController)
            }
        }
    }
}

extension View {
    func navigationBarAppearance(configure: @escaping (UINavigationController) -> Void) -> some View {
        self.modifier(NavigationConfigurator(configure: configure))
    }
}
