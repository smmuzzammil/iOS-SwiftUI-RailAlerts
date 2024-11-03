//
//  Text+AppConstants.swift
//  RailAlerts
//
//  Created by Admin on 26/10/2024.
//

import SwiftUI

extension Text {
    init(_ label: AppConstants.Labels) {
        self.init(label.rawValue)
    }
    
    init(_ title: AppConstants.Titles) {
        self.init(title.rawValue)
    }
}
