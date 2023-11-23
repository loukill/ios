//
//  ListOfDoctorsViewModel.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import Foundation
import SwiftUI

import CoreData
import Combine

class ListOfDoctorsViewModel: ObservableObject {
    @Published var doctors: [Doctor] = []
    @Published var selectedDoctor: Doctor?
    
    func fetchDoctors() {
        print("ddddddd")
        DoctorService.shared.getDoctors { result in
               switch result {
               case .success(let doctors):
                   DispatchQueue.main.async {
                       self.doctors = doctors
                      
                   }
               case .failure(let error):
                   print("Error fetching doctors: \(error.localizedDescription)")
                   // Handle the error as needed
               }
           }
       }
    func selectDoctor(_ doctor: Doctor) {
          selectedDoctor = doctor
      }
}

