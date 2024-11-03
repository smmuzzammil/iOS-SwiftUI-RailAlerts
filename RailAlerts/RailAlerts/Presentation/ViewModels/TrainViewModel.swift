//
//  TrainViewModel.swift
//  RailAlerts
//
//  Created by Admin on 26/05/2024.
//

import Foundation
import Combine

class TrainViewModel: RailwayEntityViewModel {
    
    init(homeData: ConstantData.HomeData) {
        super.init()
        list = ConstantData.getTrains(for: homeData)
    }
}
