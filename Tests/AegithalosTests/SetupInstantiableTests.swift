import XCTest
@testable import Aegithalos

final class SetupInstantiableTests: XCTestCase {
  
  func test_instantiate_createsNewInstance_onEachSetupCall() {
    let setup = Setup.of(SetupInstantiableSubject.self)
    
    XCTAssert(setup.instantiate() !== setup())
  }
  
  func test_instantiate_appliesSetup_onEachSetupCall() {
    let expectedValue = 1024
    
    let setup = Setup.of(SetupInstantiableSubject.self) { subject in
      subject.value = expectedValue
    }
    
    XCTAssertEqual(setup.instantiate().value, expectedValue)
    XCTAssertEqual(setup.instantiate().value, expectedValue)
    XCTAssertEqual(setup.instantiate().value, expectedValue)
  }
  
  func test_instantiate_hasSameResultAsCall() {
    let expectedValue = 1024
    
    let setup = Setup.of(SetupInstantiableSubject.self) { subject in
      subject.value = expectedValue
    }
    
    XCTAssertEqual(setup.instantiate().value, setup().value)
  }
}

final class SetupInstantiableSubject: SetupInstantiable {
  
  static func instantiateForSetup() -> Self {
    Self()
  }
  
  var value: Int = 42
}
