//
//  SchedulesViewModel.swift
//  RailAlerts
//
//  Created by Admin on 22/06/2024.
//

import Foundation

class SchedulesViewModel: RailwayEntityViewModel {
    private let entity: any RailwayEntity
    
    init(entity: any RailwayEntity) {
        self.entity = entity
        super.init()
        list = ConstantData.getSchedules(for: entity)
    }
    
    var title: String {
        return entity.name
    }
    
    var date: String {
        return DateHelper.formatCurrentDate()
    }
    
    var schedules: [Schedule] {
        return (list as? [Schedule]) ?? []
    }
}
