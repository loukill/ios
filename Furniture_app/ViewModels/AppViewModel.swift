//
//  AppViewModel.swift
//  Furniture_app
//
//  Created by mohamed loukil on 30/12/2023.
//

import Foundation


class AppViewModel: ObservableObject {
    @Published var currentTab: AppTab = .home

    enum AppTab {
        case home
        case forum
        case scoreboard
        // ... Autres onglets
    }
}
