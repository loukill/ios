//
//  DateFormatterExtensions.swift
//  Furniture_app
//
//  Created by mohamed loukil on 30/12/2023.
//

import Foundation

extension DateFormatter {
    static let customDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy 'à' HH:mm"
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
}
