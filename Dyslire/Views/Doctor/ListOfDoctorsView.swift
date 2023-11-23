//
//  ListOfDoctorsView.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import SwiftUI

struct ListOfDoctorsView: View {
    let doctors: [Doctor] // Assuming you have an array of doctors
   
    @StateObject  var listOfDoctorsViewModel = ListOfDoctorsViewModel()
    @State private var selectedDoctorId: String?
    
    
    var body: some View {
        
        NavigationView {
            VStack{
                List(listOfDoctorsViewModel.doctors, id: \.id) {doctor in
                  
                        DoctorRow(doctor: doctor) { doctorId in
                            selectedDoctorId = doctorId
                        }
                   
                }
                .navigationTitle("List of Doctors")
                
                
            }.onAppear {
                // Fetch doctors when the view appears
                listOfDoctorsViewModel.fetchDoctors()
            }
        }
    }
    
    
    
    
    struct ListOfDoctorsView_Previews: PreviewProvider {
        static var previews: some View {
            let sampleDoctors: [Doctor] = [
                Doctor(
                    id: "65528c5ba68b40634135cdb1",
                    name: "Do",
                    lastName: "Jaziri",
                    password: "$2b$10$Jw9kGepoRp43Stn6Rc.b7eeeifzMfYHpBS/fEaPq2DRUN2A4/Le7G",
                    numTel: 23456789,
                    location: "qsdqsdqsdqsd",
                    role: "Doctor",
                    diplomaVerification: DiplomaVerification(isVerified: false),
                    ratings: []
                    
                    
                ),
                // Add more doctors as needed
            ]
            
            return ListOfDoctorsView(doctors: sampleDoctors)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
}


