//
//  AppConstants.swift
//  RailAlerts
//
//  Created by Admin on 25/10/2024.
//

import Foundation

struct AppConstants {
    
    enum Labels: String {
        case scheduledArrival = "Scheduled Arrival:"
        case estimatedArrival = "Estimated Arrival:"
        case delayOrSpeed = "Delay or Speed:"
        case arrival = "Arrival:"
        case departure = "Departure:"
    }
    
    enum Titles: String {
        case liveTracking = "Live Tracking"
        case liveFreightTrains = "Live Freight Trains"
        case trainUpdates = "Train Updates"
        case trainSchedules = "Train Schedules"
        case stationUpdates = "Station Updates"
        case stationSchedules = "Station Schedules"
    }
    
    enum Images: String {
        case train1, train2, train3, train4, station1, station2
    }
}
