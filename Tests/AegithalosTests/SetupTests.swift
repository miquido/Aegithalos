import XCTest
@testable import Aegithalos

final class SetupTests: XCTestCase {
  
  var structSubject: StructSubject!
  var parentStructSubject: ParentStructSubject!
  var classSubject: ClassSubject!
  var parentClassSubject: ParentClassSubject!
  
  override func setUp() {
    super.setUp()
    structSubject = StructSubject()
    parentStructSubject = ParentStructSubject()
    classSubject = ClassSubject()
    parentClassSubject = ParentClassSubject()
  }
  
  override func tearDown() {
    structSubject = nil
    parentStructSubject = nil
    classSubject = nil
    parentClassSubject = nil
    super.tearDown()
  }
  
  func test_Setup_emptyOf_doesNotModifySubject_forValueType() {
    let expectedValue = structSubject.value
    let setup = Setup.of(StructSubject.self)
    
    setup(applyOn: &structSubject)
    
    XCTAssertEqual(structSubject.value, expectedValue)
  }
  
  func test_Setup_emptyOf_doesNotModifySubject_forReferenceType() {
    let expectedValue = classSubject.value
    let setup = Setup.of(ClassSubject.self)
    
    setup(applyOn: &classSubject)
    
    XCTAssertEqual(structSubject.value, expectedValue)
  }
  
  func test_Setup_applyOn_modifiesSubjectInPlace_forValueType() {
    let expectedValue = 1024
    let setup = Setup.of(StructSubject.self) {
      $0.value = expectedValue
    }
    
    setup(applyOn: &structSubject)
    
    XCTAssertEqual(structSubject.value, expectedValue)
  }
  
  func test_Setup_appliedOn_modifiesSubjectCopy_forValueType() {
    let expectedValue = 1024
    let originalValue = structSubject.value
    let setup = Setup.of(StructSubject.self) {
      $0.value = expectedValue
    }
    
    let subjectCopy = setup(appliedOn: structSubject)
    
    XCTAssertEqual(structSubject.value, originalValue)
    XCTAssertEqual(subjectCopy.value, expectedValue)
  }
  
  func test_Setup_applyOn_modifiesSubjectInPlace_forReferenceType() {
    let expectedValue = 1024
    let setup = Setup.of(ClassSubject.self) {
      $0.value = expectedValue
    }
    
    setup(applyOn: &classSubject)
    
    XCTAssertEqual(classSubject.value, expectedValue)
  }
  
  func test_Setup_appliedOn_modifiesSubjectInPlace_forReferenceType() {
    let expectedValue = 1024
    let setup = Setup.of(ClassSubject.self) {
      $0.value = expectedValue
    }
    
    let subject = setup(appliedOn: classSubject)
    
    XCTAssertEqual(subject.value, expectedValue)
    XCTAssert(subject === classSubject)
  }
  
  func test_Setup_composed_appendsModification_forValueType() {
    let expectedValue = 1024
    let setup = Setup
    .of(StructSubject.self) {
      $0.value = expectedValue - 1
    }
    .composed { (subject: inout StructSubject) in
      subject.value += 1
    }
    
    setup(applyOn: &structSubject)
    
    XCTAssertEqual(structSubject.value, expectedValue)
  }
  
  func test_Setup_composed_appendsModification_forReferenceType() {
    let expectedValue = 1024
    let setup = Setup.of(ClassSubject.self) {
      $0.value = expectedValue - 1
    }
    .composed { (subject: ClassSubject) in
      subject.value += 1
    }
    
    setup(applyOn: classSubject)
    
    XCTAssertEqual(classSubject.value, expectedValue)
  }
  
  func test_Setup_composedWithSetup_appendsModification() {
    let expectedValue = 1024
    let setup = Setup.of(ClassSubject.self) {
      $0.value = expectedValue - 1
    }
    .composed(with:
      Setup.of(ClassSubject.self) {
        $0.value += 1
      }
    )
    
    setup(applyOn: classSubject)
    
    XCTAssertEqual(classSubject.value, expectedValue)
  }
  
  func test_Setup_contramap_appliesNestedModification_forValueType() {
    let expectedValue = 1024
    let setup = Setup
    .of(StructSubject.self) {
      $0.value = expectedValue
    }
    .contramap(\ParentStructSubject.child)
    
    setup(applyOn: &parentStructSubject)
    
    XCTAssertEqual(parentStructSubject.child.value, expectedValue)
  }
  
  func test_Setup_contramap_appliesNestedModification_forReferenceType() {
    let expectedValue = 1024
    let setup = Setup.of(ClassSubject.self) {
      $0.value = expectedValue
    }
    .contramap(\ParentClassSubject.child)
    
    setup(applyOn: parentClassSubject)
    
    XCTAssertEqual(parentClassSubject.child.value, expectedValue)
  }
  
  func test_Setup_contramapClosure_appliesNestedModification_forReferenceType() {
    let expectedValue = 1024
    let setup = Setup.of(ClassSubject.self) {
      $0.value = expectedValue
    }
    .contramap { (parent: ParentClassSubject) in parent.child }
    
    setup(applyOn: parentClassSubject)
    
    XCTAssertEqual(parentClassSubject.child.value, expectedValue)
  }
}

struct StructSubject {
  var value: Int = 42
}

struct ParentStructSubject {
  var child: StructSubject = StructSubject()
}

class ClassSubject {
  var value: Int = 42
}

class ParentClassSubject {
  let child: ClassSubject = ClassSubject()
}