//
// Created by Krzysztof Brawanski on 29/10/2021.
//

import Combine

class InMemoryChargingStationService: ChargingStationService {
    func loadStation() -> AnyPublisher<ChargingStation, Never> {
        CurrentValueSubject<ChargingStation, Never>(ChargingStation(stationName: "STATION_NAME_1", stationState: "Free"))
            .eraseToAnyPublisher()
    }
}
