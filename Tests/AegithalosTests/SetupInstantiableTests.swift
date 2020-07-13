import XCTest
@testable import Aegithalos

final class SetupInstantiableTests: XCTestCase {
  
  func test_createsNewInstance_onEachSetupCall() {
    let setup = Setup.of(SetupInstantiableSubject.self)
    
    XCTAssert(setup() !== setup())
  }
  
  func test_appliesSetup_onEachSetupCall() {
    let expectedValue = 1024
    let setup = Setup.of(SetupInstantiableSubject.self) { subject in
      subject.value = expectedValue
    }
    
    XCTAssertEqual(setup().value, expectedValue)
  }
}

final class SetupInstantiableSubject: SetupInstantiable {
  
  static func instantiateForSetup() -> Self {
    Self()
  }
  
  var value: Int = 42
}
