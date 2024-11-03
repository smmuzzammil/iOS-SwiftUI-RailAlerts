//
//  Update.swift
//  RailAlerts
//
//  Created by Admin on 07/07/2024.
//

import Foundation

struct Update: Updatable {
    var id = UUID()
    var name: String
    var schedule: String
    var estimate: String
}
