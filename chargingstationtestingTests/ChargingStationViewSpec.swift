//
//  chargingstationtestingTests.swift
//  chargingstationtestingTests
//
//  Created by Krzysztof Brawanski on 22/10/2021.
//

import Quick
import Nimble
import ViewInspector

@testable import chargingstationtesting

class ChargingStationViewSpec: QuickSpec {

    private let STATION_NAME = "STATION_NAME_1"
    private let FREE_STATE = "Free"
    private var view: ChargingStationView?

    override func spec() {
        describe("When view is rendered") {
            beforeEach { [self] in
                view = ChargingStationView()
            }

            it("Should display station name") { [self] in
                expect(stationName()).to(equal(STATION_NAME))
            }

            it("Should display station state") { [self] in
                expect(stationState()).to(equal(FREE_STATE))
            }

            it("Should display start charging button") { [self] in
                expect(chargingControlButtonLabel()).to(equal("Start charging"))
            }
        }
    }

    private func stationName() -> String? {
        try? view?.body.inspect().vStack().findAll(ViewType.Text.self)[0].string()
    }

    private func stationState() -> String? {
        try? view?.body.inspect().vStack().findAll(ViewType.Text.self)[1].string()
    }

    private func chargingControlButtonLabel() -> String? {
        try? view?.body.inspect().vStack().findAll(ViewType.Button.self)[0].findAll(ViewType.Text.self)[0].string()
    }
}
