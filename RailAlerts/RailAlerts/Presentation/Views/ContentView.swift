//
//  ContentView.swift
//  RailAlerts
//
//  Created by Admin on 12/05/2024.
//

import SwiftUI

struct ContentView: View {
    init() {
        // Customize the navigation bar appearance
        UINavigationBar.appearance().backgroundColor = UIColor.black
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
        HomeView()
    }
}
