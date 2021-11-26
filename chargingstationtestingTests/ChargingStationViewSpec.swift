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

extension AvailableStateImage: Inspectable {}

class ChargingStationViewSpec: QuickSpec {

    private let STATION_NAME = "STATION_NAME_1"
    private let AVAILABLE_STATE = "Available"
    private var view: ChargingStationView?

    override func spec() {
        describe("When view is rendered") {
            beforeEach { [self] in
                view = ChargingStationView()
            }

            it("should display available charging station image") { [self] in
                expect(chargingStationImage()).to(equal("availableChargingStationImage"))
            }

            it("Should display station name") { [self] in
                expect(stationName()).to(equal(STATION_NAME))
            }

            it("should display available station state image") { [self] in
                expect(availableStateImage()).notTo(beNil())
            }

            it("Should display station state") { [self] in
                expect(stationState()).to(equal(AVAILABLE_STATE))
            }

            it("Should display start charging button") { [self] in
                expect(chargingControlButtonLabel()).to(equal("Start charging"))
            }
        }
    }

    private func chargingStationImage() -> String? {
        try? view?.body.inspect().vStack().find(ViewType.Image.self).actualImage().name()
    }

    private func stationName() -> String? {
        try? view?.body.inspect().vStack().text(1).string()
    }

    private func availableStateImage() -> InspectableView<ViewType.View<AvailableStateImage>>? {
        try? view?.body.inspect().vStack().find(AvailableStateImage.self)
    }

    private func stationState() -> String? {
        try? view?.body.inspect().vStack().text(3).string()
    }

    private func chargingControlButtonLabel() -> String? {
        try? view?.body.inspect().vStack().findAll(ViewType.Button.self)[0].findAll(ViewType.Text.self)[0].string()
    }
}
