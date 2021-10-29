// MARK: - Mocks generated from file: chargingstationtesting/ChargingStationService.swift at 2021-10-29 11:21:18 +0000

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
    

	 struct __StubbingProxy_ChargingStationService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func loadStation() -> Cuckoo.ProtocolStubFunction<(), AnyPublisher<ChargingStation, Never>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockChargingStationService.self, method: "loadStation() -> AnyPublisher<ChargingStation, Never>", parameterMatchers: matchers))
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
	    
	}
}

 class ChargingStationServiceStub: ChargingStationService {
    

    

    
     func loadStation() -> AnyPublisher<ChargingStation, Never>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<ChargingStation, Never>).self)
    }
    
}

