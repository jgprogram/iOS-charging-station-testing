//
// Created by Krzysztof Brawanski on 22/10/2021.
//

import SwiftUI
import Combine

class ChargingStationViewModel: ObservableObject {
    @Published var chargingStation: ChargingStation? = nil

    private let chargingStationService: ChargingStationService
    private var disposables = Set<AnyCancellable>()

    var chargingControlButtonLabel: String {
        if chargingStation?.stationState == "Charging" {
            return "Stop charging"
        } else {
            return "Start charging"
        }
    }

    init(chargingStationService: ChargingStationService = InMemoryChargingStationService()) {
        self.chargingStationService = chargingStationService
        loadStation()
    }

    func changeStationState() {
        chargingStation = chargingStation?.changeState()
        chargingStationService.save(chargingStation: chargingStation!)
    }

    private func loadStation() {
        chargingStationService.loadStation()
            .sink { [weak self] in self?.chargingStation = $0 }
            .store(in: &disposables)
    }
}