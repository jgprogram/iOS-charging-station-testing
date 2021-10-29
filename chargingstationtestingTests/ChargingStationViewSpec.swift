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
    private let CHARGING_STATE = "Charging"
    private var view: ChargingStationView?

    override func spec() {
        describe("When view is rendered") {
            context("with available state") {
                beforeEach { [self] in
                    view = ChargingStationView(ChargingStationViewModel(stationName: STATION_NAME, stationState: AVAILABLE_STATE))
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

                describe("and user clicks start charging button") {
                    beforeEach { [self] in
                        try? chargingControlButton()?.tap()
                    }

                    it("Should display charging station state") { [self] in
                        expect(stationState()).to(equal(CHARGING_STATE))
                    }

                    it("Should display stop charging button") { [self] in
                        expect(chargingControlButtonLabel()).to(equal("Stop charging"))
                    }
                }
            }

            context("with charging state") {
                beforeEach { [self] in
                    view = ChargingStationView(ChargingStationViewModel(stationName: STATION_NAME, stationState: CHARGING_STATE))
                }
                describe("and user clicks stop charging button") {
                    beforeEach { [self] in
                        try? chargingControlButton()?.tap()
                    }

                    it("Should display available station state") { [self] in
                        expect(stationState()).to(equal(AVAILABLE_STATE))
                    }

                    it("Should display start charging button") { [self] in
                        expect(chargingControlButtonLabel()).to(equal("Start charging"))
                    }
                }
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

    private func chargingControlButton() -> InspectableView<ViewType.Button>? {
        try? view?.body.inspect().vStack().findAll(ViewType.Button.self)[0]
    }
}
