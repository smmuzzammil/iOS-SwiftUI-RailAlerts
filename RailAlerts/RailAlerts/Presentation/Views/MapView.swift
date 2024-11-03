//
//  MapViewScreen.swift
//  RailAlerts
//
//  Created by Admin on 25/05/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let train: Train
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var locationManager: LocationManager
    
    init(train: Train) {
        self.train = train
        self.locationManager = LocationManager(latitude: train.lat, longitude: train.long)
    }
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $locationManager.region, showsUserLocation: true, annotationItems: [train]) { train in
                MapPin(coordinate: CLLocationCoordinate2D(latitude: train.lat, longitude: train.long), tint: .red)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .imageScale(.large)
                }
                Text(train.name)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
        )
    }
}
