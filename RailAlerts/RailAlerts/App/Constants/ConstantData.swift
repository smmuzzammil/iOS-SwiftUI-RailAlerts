//
//  ConstantData.swift
//  RailAlerts
//
//  Created by Admin on 25/05/2024.
//

import Foundation

class ConstantData {
    
    typealias HomeData = (image: AppConstants.Images, title: AppConstants.Titles)
    // MARK: - Home Data
    
    static let homeData: [[HomeData]] = [
        [(.train1, .liveTracking)],
        [(.train2, .liveFreightTrains)],
        [(.train3, .trainUpdates), (.train4, .trainSchedules)],
        [(.station1, .stationUpdates), (.station2, .stationSchedules)]
    ]
    
    // MARK: - ViewModel & Entity Handling
    
    static func getViewModel(for homeData: HomeData) -> RailwayEntityViewModel {
        switch homeData.title {
        case .liveTracking, .liveFreightTrains, .trainUpdates, .trainSchedules:
            return TrainViewModel(homeData: homeData)
        case .stationUpdates, .stationSchedules:
            return StationViewModel(homeData: homeData)
        }
    }
    
    static func getTrains(for homeData: HomeData) -> [any RailwayEntity] {
        return homeData.title == .liveFreightTrains ? freightTrains : trains
    }
    
    static func getStations(for homeData: HomeData) -> [any RailwayEntity] {
        return stations
    }
    
    // MARK: - Data Sources
    
    private static let plistLoader = PlistLoader()
    
    static var trains: [Train] {
        return plistLoader.loadPlist(named: "PassengerTrains") ?? []
    }
    
    static var freightTrains: [Train] {
        return plistLoader.loadPlist(named: "FreightTrains") ?? []
    }
    
    static var stations: [Station] {
        return plistLoader.loadPlist(named: "Stations") ?? []
    }
    
    
    // MARK: - Schedules and Updates
    
    private static let scheduleGenerator = ScheduleGenerator()
    private static let updateGenerator = UpdateGenerator()
    
    static func getSchedules(for entity: any RailwayEntity) -> [any Schedulable] {
        let relatedEntities: [any RailwayEntity] = entity is Train ? stations : trains + freightTrains
        return scheduleGenerator.generateSchedules(for: relatedEntities)
    }
    
    static func getUpdates(for entity: any RailwayEntity) -> [any Updatable] {
        let relatedEntities: [any RailwayEntity] = entity is Train ? stations : trains + freightTrains
        return updateGenerator.generateUpdates(for: relatedEntities)
    }
}

// MARK: - PlistLoader

class PlistLoader {
    func loadPlist<T: Decodable>(named name: String) -> T? {
        guard let path = Bundle.main.path(forResource: name, ofType: "plist"),
              let xml = FileManager.default.contents(atPath: path) else {
            print("Error finding \(name).plist")
            return nil
        }
        
        do {
            let decoder = PropertyListDecoder()
            return try decoder.decode(T.self, from: xml)
        } catch {
            print("Error decoding \(name).plist: \(error)")
            return nil
        }
    }
}

// MARK: - ScheduleGenerator

class ScheduleGenerator {
    
    func generateSchedules(for entities: [any RailwayEntity]) -> [Schedule] {
        var schedules = [Schedule]()
        var currentTime = Date.startOfDay(minutes: 30)
        
        for entity in entities.shuffled() {
            let (arrivalTime, departureTime) = generateArrivalAndDeparture(for: currentTime)
            if Calendar.current.isDateInTomorrow(departureTime) { break }
            
            let schedule = Schedule(
                name: entity.name,
                arrival: arrivalTime.formattedTime,
                departure: departureTime.formattedTime
            )
            schedules.append(schedule)
            currentTime = generateNextArrivalTime(after: departureTime)
        }
        
        return schedules
    }
    
    private func generateArrivalAndDeparture(for currentTime: Date) -> (Date, Date) {
        let randomInterval = [10, 20, 30].randomElement()!
        let departureTime = currentTime.adding(minutes: randomInterval)
        return (currentTime, departureTime)
    }
    
    private func generateNextArrivalTime(after departureTime: Date) -> Date {
        let nextArrivalInterval = Int.random(in: 30...120)
        return departureTime.adding(minutes: nextArrivalInterval)
    }
}

// MARK: - UpdateGenerator

class UpdateGenerator {
    
    func generateUpdates(for entities: [any RailwayEntity]) -> [Update] {
        var updates = [Update]()
        var currentTime = Date.startOfDay(minutes: 30)
        
        for entity in entities.shuffled() {
            let (arrivalTime, departureTime) = generateArrivalAndDeparture(for: currentTime)
            if Calendar.current.isDateInTomorrow(departureTime) { break }
            
            let update = Update(
                name: entity.name,
                schedule: arrivalTime.formattedTime,
                estimate: departureTime.formattedTime
            )
            updates.append(update)
            currentTime = generateNextArrivalTime(after: departureTime)
        }
        
        return updates
    }
    
    private func generateArrivalAndDeparture(for currentTime: Date) -> (Date, Date) {
        let randomInterval = [10, 20, 30].randomElement()!
        let departureTime = currentTime.adding(minutes: randomInterval)
        return (currentTime, departureTime)
    }
    
    private func generateNextArrivalTime(after departureTime: Date) -> Date {
        let nextArrivalInterval = Int.random(in: 30...120)
        return departureTime.adding(minutes: nextArrivalInterval)
    }
}

// MARK: - Date Extensions

extension Date {
    static func startOfDay(minutes: Int) -> Date {
        return Calendar.current.date(bySettingHour: 0, minute: minutes, second: 0, of: Date())!
    }
    
    func adding(minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
    
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
}
