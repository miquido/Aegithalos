import XCTest
import Aegithalos

final class MutationTests: XCTestCase {
  
  fileprivate var structSubject: StructSubject!
  fileprivate var classSubject: ClassSubject!
  
  override func setUp() {
    super.setUp()
    structSubject = StructSubject()
    classSubject = ClassSubject()
  }
  
  override func tearDown() {
    structSubject = nil
    classSubject = nil
    super.tearDown()
  }
  
  func test_none_doesNotMutateSubject() {
    Mutation<StructSubject>
      .none
      .apply(on: &structSubject)
    
    XCTAssertEqual(structSubject, StructSubject())
  }
  
  func test_apply_doesMutateStructSubject() {
    Mutation<StructSubject>
      .custom { $0.string = "changed" }
      .apply(on: &structSubject)
    
    XCTAssertNotEqual(structSubject, StructSubject())
  }
  
  func test_apply_doesMutateClassSubject() {
    Mutation<ClassSubject>
      .custom { (subject: ClassSubject) in
        subject.string = "changed"
      }
      .apply(on: classSubject)
    
    XCTAssertNotEqual(classSubject, ClassSubject())
  }
  
  func test_applied_doesNotMutateStructSubject() {
    _ = Mutation<StructSubject>
      .custom { $0.string = "changed" }
      .applied(on: structSubject)
    
    XCTAssertEqual(structSubject, StructSubject())
  }
  
  func test_applied_returnsMutatedStructSubject() {
    let mutated = Mutation<StructSubject>
      .custom { $0.string = "changed" }
      .applied(on: structSubject)
    
    XCTAssertNotEqual(mutated, StructSubject())
  }
  
  func test_set_setsValueOnStructSubject() {
    Mutation<StructSubject>
      .set(\.nested.int, to: 42)
      .apply(on: &structSubject)
    
    XCTAssertEqual(structSubject.nested.int, 42)
  }
  
  func test_set_setsValueOnClassSubject() {
    Mutation<ClassSubject>
      .set(\.nested.int, to: 42)
      .apply(on: classSubject)
    
    XCTAssertEqual(classSubject.nested.int, 42)
  }
  
  func test_combined_combineMutations() {
    Mutation<StructSubject>
      .combined(
        .set(\.string, to: "changed"),
        .set(\.nested.int, to: 42)
      )
      .apply(on: &structSubject)
    
    XCTAssertEqual(structSubject.string, "changed")
    XCTAssertEqual(structSubject.nested.int, 42)
  }
  
  func test_contramap_appliesMutationsOnMappedStructSubject() {
    Mutation<StructSubject.Nested>
      .set(\.int, to: 42)
      .contramap(\StructSubject.nested)
      .apply(on: &structSubject)
    
    XCTAssertEqual(structSubject.nested.int, 42)
  }
  
  func test_contramap_appliesMutationsOnMappedClassSubject() {
    Mutation<ClassSubject.Nested>
      .set(\.int, to: 42)
      .contramap(\ClassSubject.nested)
      .apply(on: classSubject)
    
    XCTAssertEqual(classSubject.nested.int, 42)
  }
  
  func test_contramapOptional_appliesMutationsOnOptionalSubject() {
    Mutation<StructSubject>
      .set(\.string, to: "changed")
      .contramapOptional()
      .apply(on: &structSubject)
    
    XCTAssertEqual(structSubject.string, "changed")
  }
  
  func test_when_withTrue_appliesThenMutationsOnSubject() {
    Mutation<StructSubject>
      .when(
        true,
        then: .set(\.string, to: "then"),
        else: .set(\.string, to: "else")
      )
      .apply(on: &structSubject)
    
    XCTAssertEqual(structSubject.string, "then")
  }
  
  func test_when_withFalse_appliesElseMutationsOnSubject() {
    Mutation<StructSubject>
      .when(
        false,
        then: .set(\.string, to: "then"),
        else: .set(\.string, to: "else")
      )
      .apply(on: &structSubject)
    
    XCTAssertEqual(structSubject.string, "else")
  }
  
  func test_whenSome_withSome_appliesThenMutationsOnSubject() {
    Mutation<StructSubject>
      .whenSome(
        "then",
        then: { .set(\.string, to: $0) },
        else: .set(\.string, to: "else")
      )
      .apply(on: &structSubject)
    
    XCTAssertEqual(structSubject.string, "then")
  }
  
  func test_whenSome_withSome_passesUnwrappedValueToThenClosure() {
    Mutation<StructSubject>
      .whenSome(
        "then",
        then: {
          XCTAssertEqual($0, "then")
          return .none
        },
        else: .set(\.string, to: "else")
      )
      .apply(on: &structSubject)
  }
  
  func test_whenSome_withNone_appliesElseMutationsOnSubject() {
    Mutation<StructSubject>
      .whenSome(
        Optional<String>.none,
        then: { .set(\.string, to: $0) },
        else: .set(\.string, to: "else")
      )
      .apply(on: &structSubject)
    
    XCTAssertEqual(structSubject.string, "else")
  }
  
  func test_with_passesVariableToMutationClosure() {
    Mutation<StructSubject>
      .with(
        { "changed" },
        { .set(\.string, to: $0) }
      )
      .apply(on: &structSubject)
    
    XCTAssertEqual(structSubject.string, "changed")
  }
  
  func test_with_computesVariableOnEachApplication() {
    var counter = 0
    let mutation =
    Mutation<StructSubject>
      .with(
        {
          counter += 1
          return counter
        },
        { .set(\.nested.int, to: $0) }
      )
    
    XCTAssertEqual(structSubject.nested.int, 0)
    
    mutation
      .apply(on: &structSubject)
    
    XCTAssertEqual(structSubject.nested.int, 1)
    
    mutation
      .apply(on: &structSubject)
    
    XCTAssertEqual(structSubject.nested.int, 2)
    
    mutation
      .apply(on: &structSubject)
    
    XCTAssertEqual(structSubject.nested.int, 3)
  }
  
  func test_mut_doesMutateStructSubject() {
    mut(&structSubject) {
      .set(\.string, to: "changed")
    }
    
    XCTAssertNotEqual(structSubject, StructSubject())
  }
  
  func test_mut_doesMutateClassSubject() {
    mut(classSubject) {
      .set(\.string, to: "changed")
    }
    
    XCTAssertNotEqual(classSubject, ClassSubject())
  }
  
  func test_dispatchPrecondition_verifiesDispatchQueue() {
    mut(&structSubject) {
      .dispatchPrecondition(.onQueue(.main))
    }
  }
  
  func test_instantiate_withoutMutations_makesUnmodifiedInstance() {
    let instantiated = Mutation<StructSubject>
      .none
      .instantiate()
    
    XCTAssertEqual(instantiated, StructSubject())
  }
  
  func test_instantiate_withMutations_makesMutatedInstance() {
    let instantiated = Mutation<StructSubject>
      .set(\.string, to: "changed")
      .instantiate()
    
    XCTAssertNotEqual(instantiated, StructSubject())
  }
}

private struct StructSubject: Equatable, EmptyInstantiable {
  
  var string: String = ""
  var nested: Nested = Nested()
  
  struct Nested: Equatable {
    
    var int: Int = 0
  }
}

private class ClassSubject: Equatable, EmptyInstantiable {
  
  var string: String = ""
  var nested: Nested = Nested()
  
  required init() {}
  
  class Nested: Equatable {
    
    var int: Int = 0
    
    static func == (
      lhs: ClassSubject.Nested,
      rhs: ClassSubject.Nested
    ) -> Bool {
      lhs.int == rhs.int
    }
  }
  
  static func == (
    lhs: ClassSubject,
    rhs: ClassSubject
  ) -> Bool {
    lhs.string == rhs.string
      && lhs.nested == rhs.nested
  }
}
