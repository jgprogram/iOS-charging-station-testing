//
// Created by Krzysztof Brawanski on 29/10/2021.
//

import Foundation

struct ChargingStation {
    let stationName: String
    let stationState: String

    func changeState() -> ChargingStation {
        if stationState == "Available" {
            return ChargingStation(stationName: stationName, stationState: "Charging")
        } else {
            return ChargingStation(stationName: stationName, stationState: "Available")
        }
    }
}
