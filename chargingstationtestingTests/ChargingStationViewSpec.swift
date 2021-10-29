//
//  chargingstationtestingTests.swift
//  chargingstationtestingTests
//
//  Created by Krzysztof Brawanski on 22/10/2021.
//

import Quick
import Nimble
import ViewInspector
import Cuckoo
import Combine

@testable import chargingstationtesting

extension AvailableStateImage: Inspectable {}
extension ChargingStateImage: Inspectable {}

class ChargingStationViewSpec: QuickSpec {

    private let STATION_NAME = "STATION_NAME_1"
    private let AVAILABLE_STATE = "Available"
    private let CHARGING_STATE = "Charging"
    private var view: ChargingStationView?
    private var chargingStationService: MockChargingStationService?
    private var chargingStationCaptor: ArgumentCaptor<ChargingStation>?

    override func spec() {
        describe("When view is rendered") {
            context("with available state") {
                beforeEach { [self] in
                    chargingStationService = MockChargingStationService()
                    stub(chargingStationService!) { mock in
                        when(mock).loadStation()
                            .thenReturn(CurrentValueSubject<ChargingStation, Never>(
                                ChargingStation(stationName: STATION_NAME, stationState: FREE_STATE)).eraseToAnyPublisher())
                        when(mock).save(chargingStation: any()).thenDoNothing()
                    }

                    view = ChargingStationView(ChargingStationViewModel(chargingStationService: chargingStationService!))
                }

                it("should display available charging station image") { [self] in
                    expect(chargingStationImage()).to(equal("availableChargingStationImage"))
                }

                it("should display station name") { [self] in
                    expect(stationName()).to(equal(STATION_NAME))
                }

                it("should display available station state image") { [self] in
                    expect(availableStateImage()).notTo(beNil())
                }

                it("should display station state") { [self] in
                    expect(stationState()).to(equal(AVAILABLE_STATE))
                }

                it("should display start charging button") { [self] in
                    expect(chargingControlButtonLabel()).to(equal("Start charging"))
                }

                describe("and user clicks start charging button") {
                    beforeEach { [self] in
                        chargingStationCaptor = ArgumentCaptor<ChargingStation>()
                        try? chargingControlButton()?.tap()
                    }

                    it("should display charging station image") { [self] in
                        expect(chargingStationImage()).to(equal("chargingChargingStationImage"))
                    }

                    it("should display station state image") { [self] in
                        expect(chargingStateImage()).notTo(beNil())
                    }

                    it("Should display charging station state") { [self] in
                        expect(stationState()).to(equal(CHARGING_STATE))
                    }

                    it("Should display stop charging button") { [self] in
                        expect(chargingControlButtonLabel()).to(equal("Stop charging"))
                    }

                    it("should save station with new state") { [self] in
                        verify(chargingStationService!, times(1)).save(chargingStation: chargingStationCaptor!.capture())
                        expect(chargingStationCaptor?.value?.stationState).to(equal(CHARGING_STATE))
                    }
                }
            }

            context("with charging state") {
                beforeEach { [self] in
                    chargingStationService = MockChargingStationService()
                    stub(chargingStationService!) { mock in
                        when(mock).loadStation()
                            .thenReturn(CurrentValueSubject<ChargingStation, Never>(
                                ChargingStation(stationName: STATION_NAME, stationState: CHARGING_STATE)).eraseToAnyPublisher())
                        when(mock).save(chargingStation: any()).thenDoNothing()
                    }
                    view = ChargingStationView(ChargingStationViewModel(chargingStationService: chargingStationService!))
                }

                it("should display charging charging station image") { [self] in
                    expect(chargingStationImage()).to(equal("chargingChargingStationImage"))
                }

                it("should display station name") { [self] in
                    expect(stationName()).to(equal(STATION_NAME))
                }

                it("should display charging station state image") { [self] in
                    expect(chargingStateImage()).notTo(beNil())
                }

                it("should display station state") { [self] in
                    expect(stationState()).to(equal(CHARGING_STATE))
                }

                it("should display stop charging button") { [self] in
                    expect(chargingControlButtonLabel()).to(equal("Stop charging"))
                }

                describe("and user clicks stop charging button") {
                    beforeEach { [self] in
                        chargingStationCaptor = ArgumentCaptor<ChargingStation>()
                        try? chargingControlButton()?.tap()
                    }

                    it("should display available station state") { [self] in
                        expect(stationState()).to(equal(AVAILABLE_STATE))
                    }

                    it("should display start charging button") { [self] in
                        expect(chargingControlButtonLabel()).to(equal("Start charging"))
                    }

                    it("should save station with new state") { [self] in
                        verify(chargingStationService!, times(1)).save(chargingStation: chargingStationCaptor!.capture())
                        expect(chargingStationCaptor?.value?.stationState).to(equal(FREE_STATE))
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

    private func chargingStateImage() -> InspectableView<ViewType.View<ChargingStateImage>>? {
        try? view?.body.inspect().vStack().find(ChargingStateImage.self)
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
