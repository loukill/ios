//
//  DyslireApp.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import SwiftUI

@main
struct DyslireApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomePageView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
