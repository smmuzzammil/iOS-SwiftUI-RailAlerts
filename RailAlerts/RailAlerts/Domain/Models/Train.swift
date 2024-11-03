//
//  Train.swift
//  RailAlerts
//
//  Created by Admin on 26/05/2024.
//

import Foundation

struct Train: RailwayEntity, Locatable {
    var id = UUID()
    var name: String
    var lat: Double
    var long: Double
    
    enum CodingKeys: String, CodingKey {
        case name
        case lat
        case long
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.lat = try container.decode(Double.self, forKey: .lat)
        self.long = try container.decode(Double.self, forKey: .long)
        self.id = UUID()
    }
}
