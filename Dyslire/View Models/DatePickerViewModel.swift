//
//  DatePickerViewModel.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import Foundation
import SwiftUI


class DatePickerViewModel: ObservableObject {
    @Published var selectedDate = Date()
    @Published var selectedTime = Date()
}
    

