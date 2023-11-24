//
//  dyslireApp.swift
//  dyslire
//
//  Created by rayenbellali on 8/11/2023.
//

import SwiftUI

@main
struct dyslireApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
