//
// Created by Krzysztof Brawanski on 29/10/2021.
//

import Combine

class InMemoryChargingStationService: ChargingStationService {
    func loadStation() -> AnyPublisher<ChargingStation, Never> {
        CurrentValueSubject<ChargingStation, Never>(ChargingStation(stationName: "FAST-CHARGER-2137", stationState: "Available"))
            .eraseToAnyPublisher()
    }

    func save(chargingStation: ChargingStation) {

    }
}
