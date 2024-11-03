//
//  RailwayEntity.swift
//  RailAlerts
//
//  Created by Admin on 26/05/2024.
//

import Foundation

protocol RailwayEntity: Identifiable, Decodable {
    var name: String { get set }
}
