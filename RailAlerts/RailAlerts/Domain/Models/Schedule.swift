//
//  Schedule.swift
//  RailAlerts
//
//  Created by Admin on 22/06/2024.
//

import Foundation

struct Schedule: Schedulable {
    var id = UUID()
    var name: String
    var arrival: String
    var departure: String
}
