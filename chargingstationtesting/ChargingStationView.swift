//
//  ContentView.swift
//  chargingstationtesting
//
//  Created by Krzysztof Brawanski on 22/10/2021.
//

import SwiftUI

struct ChargingStationView: View {

    @ObservedObject private var viewModel: ChargingStationViewModel

    init(_ viewModel: ChargingStationViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            if let chargingStation = viewModel.chargingStation {
                Image(viewModel.chargingStation?.stationState == "Available" ? "availableChargingStationImage" : "chargingChargingStationImage")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(viewModel.chargingStation?.stationName)
                if viewModel.chargingStation?.stationState == "Available" {
                    AvailableStateImage()
                } else {
                    ChargingStateImage()
                }
                Text(viewModel.chargingStation?.stationState)

                Button(action: {
                    viewModel.changeStationState()
                }) {
                    Text(viewModel.chargingControlButtonLabel)
                }
            }
        }
    }
}

struct AvailableStateImage: View {
    var body: some View {
        Circle()
            .fill(Color.green)
            .frame(width: 10, height: 10)
    }
}

struct ChargingStateImage: View {
    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 10, height: 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChargingStationView(ChargingStationViewModel(stationName: "StationName1", stationState: "Charging"))
    }
}
