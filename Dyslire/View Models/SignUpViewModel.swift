//
//  SignUpViewModel.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import Foundation
import SwiftUI

import CoreData
import Combine

class SignUpViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var lastName: String = ""
    @Published var password: String = ""
    @Published var BirthDate: Date?
        @Published var numTel: String = ""
        @Published var otpSent: Bool = false
        @Published var otpResponse: String = ""
    @Published var otp: [String] = Array(repeating: "", count: 6)
       private var cancellables: Set<AnyCancellable> = []
    @Published var focusedTextField: Int = 0

    private var dateFormatter: DateFormatter {
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM-dd" // Adjust the format based on your needs
           return formatter
       }
    func sendOTP() {
        UserServices.shared.sendOtp(numTel: numTel) { result in
            switch result {
            case .success(let otp):
                // Handle success, e.g., set otpSent to true or show a message
                self.otpSent = true
                self.otpResponse = otp
            case .failure(let error):
                // Handle error, e.g., show an alert
                print("Error sending OTP: \(error)")
            }
        }
    }
    func RegistrationSubmit() {
 // Assuming you have a function in your UserService for patient signup
        print(dateFormatter.string(for:BirthDate))
            UserServices.shared.PatientSignUp(
                name: name,
                lastName: lastName,
                password: password,
                numTel: numTel,
                dateNaiss: dateFormatter.string(from: BirthDate ?? Date()), // Format your date as needed
                otp: otp.joined(separator: "")
            ) { result in
                switch result {
                case .success(let message):
                    // Handle success, e.g., navigate to the next screen
                    print("Success: \(message)")
                case .failure(let error):
                    // Handle error, e.g., show an alert
                    print("Error: \(error)")
                }
            }
        
        }
   }

  
   

    

