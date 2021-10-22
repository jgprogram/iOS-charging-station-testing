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
            Text("STATION_NAME_1")
            Text("Free")
            Button(action: {}) {
                Text("Start charging")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChargingStationView()
    }
}
