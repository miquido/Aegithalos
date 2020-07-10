import XCTest
@testable import Aegithalos

final class ConditionalsTests: XCTestCase {
  
  func test_when_withTrue_returnsThenValue() {
    XCTAssertTrue(when(true, then: { true }, else: { false }))
  }
  
  func test_when_withFalse_returnsElseValue() {
    XCTAssertTrue(when(false, then: { false }, else: { true }))
  }
  
  func test_when_withTrue_executesThen() {
    var executed: Bool = false
    when(true, then: { executed = true })
    XCTAssertTrue(executed)
  }
  
  func test_when_withFalse_notExecutesThen() {
    var notExecuted: Bool = true
    when(false, then: { notExecuted = false })
    XCTAssertTrue(notExecuted)
  }
  
  func test_whenNot_withFalse_returnsThenValue() {
    XCTAssertTrue(whenNot(false, then: { true }, else: { false }))
  }
  
  func test_whenNot_withTrue_returnsElseValue() {
    XCTAssertTrue(whenNot(true, then: { false }, else: { true }))
  }
  
  func test_whenNot_withFalse_executesThen() {
    var executed: Bool = false
    whenNot(false, then: { executed = true })
    XCTAssertTrue(executed)
  }
  
  func test_whenNot_withTrue_notExecutesThen() {
    var notExecuted: Bool = true
    whenNot(true, then: { notExecuted = false })
    XCTAssertTrue(notExecuted)
  }
  
  func test_Bool_whenTrue_withTrue_executesClosure() {
    var executed: Bool = false
    Bool(true).whenTrue { executed = true }
    XCTAssertTrue(executed)
  }
  
  func test_Bool_whenTrue_withFalse_notExecutesClosure() {
    var notExecuted: Bool = true
    Bool(false).whenTrue { notExecuted = false }
    XCTAssertTrue(notExecuted)
  }
  
  func test_Bool_whenFalse_withFalse_executesClosure() {
    var executed: Bool = false
    Bool(false).whenFalse { executed = true }
    XCTAssertTrue(executed)
  }
  
  func test_Bool_whenFalse_withTrue_notExecutesClosure() {
    var notExecuted: Bool = true
    Bool(true).whenFalse { notExecuted = false }
    XCTAssertTrue(notExecuted)
  }
  
  func test_Optional_whenSome_withSome_executesClosure_withValue() {
    let testValue = 42
    var executed: Bool = false
    Optional<Int>.some(testValue).whenSome { value in
      XCTAssertEqual(value, testValue)
      executed = true
    }
    XCTAssertTrue(executed)
  }
  
  func test_Optional_whenSome_withNone_notExecutesClosure() {
    var notExecuted: Bool = true
    Optional<Int>.none.whenSome { _ in notExecuted = false }
    XCTAssertTrue(notExecuted)
  }
  
  func test_Optional_whenNone_withNone_executesClosure() {
    var executed: Bool = false
    Optional<Int>.none.whenNone { executed = true }
    XCTAssertTrue(executed)
  }
  
  func test_Optional_whenNone_withSome_notExecutesClosure() {
    let testValue = 42
    var notExecuted: Bool = true
    Optional<Int>.some(testValue).whenNone { notExecuted = false }
    XCTAssertTrue(notExecuted)
  }
  
  func test_Result_whenSuccess_withSuccess_executesClosure_withValue() {
    let testValue = 42
    var executed: Bool = false
    Result<Int, Error>.success(testValue).whenSuccess { value in
      XCTAssertEqual(value, testValue)
      executed = true
    }
    XCTAssertTrue(executed)
  }
  
  func test_Result_whenSuccess_withFailure_notExecutesClosure() {
    let testError = NSError(domain: "TEST", code: 0, userInfo: nil)
    var notExecuted: Bool = true
    Result<Int, Error>.failure(testError).whenSuccess { _ in notExecuted = false }
    XCTAssertTrue(notExecuted)
  }
  
  func test_Result_whenFailure_withFailure_executesClosure_withError() {
    let testError = NSError(domain: "TEST", code: 0, userInfo: nil)
    var executed: Bool = false
    Result<Int, Error>.failure(testError).whenFailure { error in
      XCTAssertEqual(error as NSError, testError)
      executed = true
    }
    XCTAssertTrue(executed)
  }
  
  func test_Result_whenFailure_withSuccess_notExecutesClosure() {
    let testValue = 42
    var notExecuted: Bool = true
    Result<Int, Error>.success(testValue).whenFailure { _ in notExecuted = false }
    XCTAssertTrue(notExecuted)
  }
}
