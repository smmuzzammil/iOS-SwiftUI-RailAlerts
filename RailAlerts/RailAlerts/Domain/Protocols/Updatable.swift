//
//  Updatable.swift
//  RailAlerts
//
//  Created by Admin on 07/07/2024.
//

import Foundation

protocol Updatable: RailwayEntity {
    var schedule: String { get set }
    var estimate: String { get set }
}
