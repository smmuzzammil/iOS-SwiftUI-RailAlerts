//
//  SchedulesView.swift
//  RailAlerts
//
//  Created by Admin on 27/05/2024.
//

import SwiftUI

struct SchedulesView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: SchedulesViewModel
    
    init(entity: any RailwayEntity) {
        _viewModel = StateObject(wrappedValue: SchedulesViewModel(entity: entity))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Color.black.frame(height: 15)
            List(viewModel.schedules) { schedule in
                ScheduleView(schedule: schedule)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: TitleBar(title: viewModel.title, subtitle: viewModel.date, leadingAction: {
                self.presentationMode.wrappedValue.dismiss()
            })
        )

    }
}

struct ScheduleView: View {
    let schedule: any Schedulable
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(schedule.name)
                .font(.headline)
            HStack {
                Text(.arrival)
                Text(schedule.arrival)
                Spacer()
                Text(.departure)
                Text(schedule.departure)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
