//
// Created by Krzysztof Brawanski on 29/10/2021.
//

import Combine

protocol ChargingStationService {
    func loadStation() -> AnyPublisher<ChargingStation, Never>
    func save(chargingStation: ChargingStation)
}
