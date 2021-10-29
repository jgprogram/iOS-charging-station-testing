//
//  chargingstationtestingApp.swift
//  chargingstationtesting
//
//  Created by Krzysztof Brawanski on 22/10/2021.
//

import SwiftUI

@main
struct ChargingStationTestingApp: App {
    var body: some Scene {
        WindowGroup {
            ChargingStationView(ChargingStationViewModel())
        }
    }
}
