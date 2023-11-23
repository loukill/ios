//
//  SignInViewModel.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import Foundation
import SwiftUI
import Combine
class SignInViewModel: ObservableObject {
    @Environment(\.presentationMode) var presentationMode
    @Published var nextScreen: String? = nil
    @Published var numTel: String = ""
    @Published var password: String = ""
    @Published var isValidFormText: Bool = true
    @Published var isValidFormoneText: Bool = true
    @Published var remembermeCheckbox: Bool = false
    @Published var errorMessage: String = ""
    @Published var isLogged = false
    func login() {
            guard !numTel.isEmpty, !password.isEmpty else {
                errorMessage = "Please enter both phone number and password."
                return
            }

        UserServices.shared.login(numTel: numTel, password: password) { [self] result in
            DispatchQueue.main.async { [self] in
                        switch result {
                        case .success(let user):
                            // Update your session manager with the received user
                            SessionManager.shared.user = user
                       
                            // Set the isLogged flag to true
                            isLogged = true
                            nextScreen = "HomePageView"
                            
                            print("login succeeded")
                            print(user)
                            print(SessionManager.shared.authToken)

                            // Optionally, navigate to the home page
                            // NavigationManager.shared.navigateToHome()

                        case .failure(let error):
                            // Handle the login failure, e.g., show an alert
                            print("Login failed: \(error)")
                        }
                    }
               }
        }
}

