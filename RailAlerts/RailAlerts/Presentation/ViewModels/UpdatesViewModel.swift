//
//  UpdatesViewModel.swift
//  RailAlerts
//
//  Created by Admin on 07/07/2024.
//

import Foundation

class UpdatesViewModel: RailwayEntityViewModel {
    private let entity: any RailwayEntity
    
    init(entity: any RailwayEntity) {
        self.entity = entity
        super.init()
        list = ConstantData.getUpdates(for: entity)
    }
    
    var title: String {
        return entity.name
    }
    
    var date: String {
        return DateHelper.formatCurrentDate()
    }
    
    var updates: [Update] {
        return (list as? [Update]) ?? []
    }
}
