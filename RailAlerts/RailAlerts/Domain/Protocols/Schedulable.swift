//
//  Schedulable.swift
//  RailAlerts
//
//  Created by Admin on 23/06/2024.
//

import Foundation

protocol Schedulable: RailwayEntity {
    var arrival: String { get set }
    var departure: String { get set }
}
