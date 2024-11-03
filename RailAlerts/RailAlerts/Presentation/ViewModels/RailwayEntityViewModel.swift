//
//  RailwayEntityViewModel.swift
//  RailAlerts
//
//  Created by Admin on 26/05/2024.
//

import Foundation

class RailwayEntityViewModel: ObservableObject {
    @Published var list: [any RailwayEntity] = []
}
