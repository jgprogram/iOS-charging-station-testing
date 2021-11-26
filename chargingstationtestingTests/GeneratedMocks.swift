// MARK: - Mocks generated from file: chargingstationtesting/ChargingStationService.swift at 2021-11-26 19:46:00 +0000

//
// Created by Krzysztof Brawanski on 29/10/2021.
//

import Cuckoo
@testable import chargingstationtesting

import Combine


 class MockChargingStationService: ChargingStationService, Cuckoo.ProtocolMock {
    
     typealias MocksType = ChargingStationService
    
     typealias Stubbing = __StubbingProxy_ChargingStationService
     typealias Verification = __VerificationProxy_ChargingStationService

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ChargingStationService?

     func enableDefaultImplementation(_ stub: ChargingStationService) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func loadStation() -> AnyPublisher<ChargingStation, Never> {
        
    return cuckoo_manager.call("loadStation() -> AnyPublisher<ChargingStation, Never>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.loadStation())
        
    }
    
    
    
     func save(chargingStation: ChargingStation)  {
        
    return cuckoo_manager.call("save(chargingStation: ChargingStation)",
            parameters: (chargingStation),
            escapingParameters: (chargingStation),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.save(chargingStation: chargingStation))
        
    }
    

	 struct __StubbingProxy_ChargingStationService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func loadStation() -> Cuckoo.ProtocolStubFunction<(), AnyPublisher<ChargingStation, Never>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockChargingStationService.self, method: "loadStation() -> AnyPublisher<ChargingStation, Never>", parameterMatchers: matchers))
	    }
	    
	    func save<M1: Cuckoo.Matchable>(chargingStation: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(ChargingStation)> where M1.MatchedType == ChargingStation {
	        let matchers: [Cuckoo.ParameterMatcher<(ChargingStation)>] = [wrap(matchable: chargingStation) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockChargingStationService.self, method: "save(chargingStation: ChargingStation)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ChargingStationService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func loadStation() -> Cuckoo.__DoNotUse<(), AnyPublisher<ChargingStation, Never>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("loadStation() -> AnyPublisher<ChargingStation, Never>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func save<M1: Cuckoo.Matchable>(chargingStation: M1) -> Cuckoo.__DoNotUse<(ChargingStation), Void> where M1.MatchedType == ChargingStation {
	        let matchers: [Cuckoo.ParameterMatcher<(ChargingStation)>] = [wrap(matchable: chargingStation) { $0 }]
	        return cuckoo_manager.verify("save(chargingStation: ChargingStation)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ChargingStationServiceStub: ChargingStationService {
    

    

    
     func loadStation() -> AnyPublisher<ChargingStation, Never>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<ChargingStation, Never>).self)
    }
    
     func save(chargingStation: ChargingStation)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

