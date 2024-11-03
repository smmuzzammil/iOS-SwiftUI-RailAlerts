//
//  DateHelper.swift
//  RailAlerts
//
//  Created by Admin on 25/10/2024.
//

import Foundation

struct DateHelper {
    
    static func formatCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: Date())
    }
}
