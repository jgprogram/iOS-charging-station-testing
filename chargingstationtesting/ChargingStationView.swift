//
//  ContentView.swift
//  chargingstationtesting
//
//  Created by Krzysztof Brawanski on 22/10/2021.
//

import SwiftUI

struct ChargingStationView: View {
    var body: some View {
        VStack {
            Image("availableChargingStationImage")
                .resizable()
                .frame(width: 100, height: 100)
            Text("STATION_NAME_1")
            AvailableStateImage()
            Text("Available")
            Button(action: {}) {
                Text("Start charging")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChargingStationView()
    }
}
