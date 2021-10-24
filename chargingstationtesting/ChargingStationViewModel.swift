//
// Created by Krzysztof Brawanski on 22/10/2021.
//

import SwiftUI

class ChargingStationViewModel: ObservableObject {

    @Published var stationName: String
    @Published var stationState: String
    var chargingControlButtonLabel: String {
        if stationState == "Charging" {
            return "Stop charging"
        } else {
            return "Start charging"
        }
    }

    init(stationName: String, stationState: String) {
        self.stationName = stationName
        self.stationState = stationState
    }

    func changeStationState() {
        if stationState == "Available" {
            stationState = "Charging"
        } else {
            stationState = "Available"
        }
    }
}