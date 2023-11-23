//
//  DoctorRow.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import SwiftUI

struct DoctorRow: View {
    var doctor: Doctor
    
    
    var onBookAppointment: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text( doctor.name )
                .font(.headline)
                .padding(.bottom, 5)
            
            Text( doctor.lastName )
                .font(.headline)
                .padding(.bottom, 5)
            
            
            HStack {
                Spacer()
                Button(action: {
                    onBookAppointment(doctor.id) // Pass the doctor's ID when the button is tapped
                }) {
                    Text("Book Appointment")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(5)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
        }
    }
}

