//
//  HomePageViewModel.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import Foundation
import SwiftUI

class HomepageViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
}
func logout() {
    SessionManager.shared.logout()
    // Optionally, navigate to the login view or perform other post-logout actions
}
