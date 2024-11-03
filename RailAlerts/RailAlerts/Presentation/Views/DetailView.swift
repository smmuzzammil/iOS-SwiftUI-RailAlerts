//
//  DetailView.swift
//  RailAlerts
//
//  Created by Admin on 12/05/2024.
//

import SwiftUI

struct DetailView: View {
    
    let homeData: ConstantData.HomeData
    @State private var searchText = ""
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: RailwayEntityViewModel
    
    init(homeData: ConstantData.HomeData) {
        self.homeData = homeData
        _viewModel = StateObject(wrappedValue: ConstantData.getViewModel(for: homeData))
    }
    
    var body: some View {
        SearchBar(text: $searchText)
            .background(.black)
        List {
            ForEach(0..<filteredItems.count, id: \.self) { i in
                let entity = filteredItems[i]
                NavigationLink(destination: destinationView(for: entity)) {
                    Text(entity.name)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: TitleBar(title: homeData.title.rawValue, leadingAction: {
                self.presentationMode.wrappedValue.dismiss()
            })
        )
    }
    
    private var filteredItems: [any RailwayEntity] {
        if searchText.isEmpty {
            return viewModel.list
        } else {
            return viewModel.list.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    private func destinationView(for entity: any RailwayEntity) -> AnyView {
          switch homeData.title {
          case .liveTracking, .liveFreightTrains:
              if let train = entity as? Train {
                  return AnyView(MapView(train: train))
              }
          case .trainUpdates, .stationUpdates:
              return AnyView(UpdatesView(entity: entity))
          case .trainSchedules, .stationSchedules:
              return AnyView(SchedulesView(entity: entity))
          }
          return AnyView(EmptyView())
      }
}


struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding()
            
            Button(action: {
                self.text = ""
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
            }
        }
    }
}
