//
//  UpdatesView.swift
//  RailAlerts
//
//  Created by Admin on 27/05/2024.
//

import SwiftUI

struct UpdatesView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: UpdatesViewModel
    
    init(entity: any RailwayEntity) {
        _viewModel = StateObject(wrappedValue: UpdatesViewModel(entity: entity))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Color.black.frame(height: 15)
            List(viewModel.updates) { schedule in
                UpdateView(update: schedule)
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

struct UpdateView: View {
    let update: any Updatable
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(update.name)
                .font(.headline)
            HStack {
                Text(.scheduledArrival)
                Spacer()
                Text(update.schedule)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            HStack {
                Text(.estimatedArrival)
                Spacer()
                Text(update.estimate)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            HStack {
                Text(.delayOrSpeed)
                Spacer()
                Text("12 min or 99 km/hr")
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
