//
//  forum_appApp.swift
//  forum-app
//
//  Created by macbook on 22/11/2023.
//

import SwiftUI

@main
struct ForumApp: App {
    @StateObject private var viewModel = ForumListViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}



