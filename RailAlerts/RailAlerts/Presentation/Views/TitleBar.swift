//
//  TitleBar.swift
//  RailAlerts
//
//  Created by Admin on 27/05/2024.
//

import SwiftUI

struct TitleBar: View {
    let title: String
    var subtitle: String? = nil
    let leadingAction: () -> Void
    
    var body: some View {
        HStack {
            if let subtitle = subtitle {
                VStack(alignment: .leading) {
                    leadingButton()
                    Spacer()
                }
                VStack(alignment: .leading) {
                    Text(title)
                        .bold()
                    Text(subtitle)
                        .font(.subheadline)
                }
            } else {
                leadingButton()
                Text(title)
                    .bold()
            }
            Spacer()
        }
        .foregroundColor(.white)
    }
    
    private func leadingButton() -> some View {
        Button(action: {
            leadingAction()
        }) {
            Image(systemName: "chevron.left")
                .imageScale(.large)
        }
    }
}
