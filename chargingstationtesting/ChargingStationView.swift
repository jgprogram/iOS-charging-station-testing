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
                HStack {
                    Image(chargingStation.stationState == "Available" ? "availableChargingStationImage" : "chargingChargingStationImage")
                        .resizable()
                        .frame(width: 150, height: 150)

                    VStack(alignment: .leading) {
                        Text(chargingStation.stationName)

                        HStack {
                            if chargingStation.stationState == "Available" {
                                AvailableStateImage()
                            } else {
                                ChargingStateImage()
                            }
                            Text(chargingStation.stationState)
                        }
                    }
                }

                Button(action: {
                    viewModel.changeStationState()
                }) {
                    Text(viewModel.chargingControlButtonLabel)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                        .padding(.horizontal, 50)
                }
            }
        }
            .frame(height: 220)
            .frame(maxWidth: .infinity)
            .background(Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255))
            .cornerRadius(12)
            .padding(.horizontal, 16)
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
        ChargingStationView(ChargingStationViewModel())
    }
}
