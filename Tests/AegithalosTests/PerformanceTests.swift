import XCTest
import Aegithalos

final class PerformanceTests: XCTestCase {
  
  static let iterations = 0 ..< 8_192
  
  func testPerformance_referenceWithSingleSet_onValueType() {
    var subject = StructSubject()
    
    measure {
      for _ in PerformanceTests.iterations {
        subject.value = 0
      }
    }
  }
  
  func testPerformance_referenceWithSingleSet_onReferenceType() {
    let subject = ClassSubject()
    
    measure {
      for _ in PerformanceTests.iterations {
        subject.value = 0
      }
    }
  }
  
  func testPerformance_referenceWithMultipleSet_onValueType() {
    var subject = StructSubject()
    
    measure {
      for _ in PerformanceTests.iterations {
        subject.value = 0
        subject.otherValue = ""
        subject.value = 0
        subject.otherValue = ""
        subject.value = 0
        subject.otherValue = ""
        subject.value = 0
      }
    }
  }
  
  func testPerformance_referenceWithMultipleSet_onReferenceType() {
    let subject = ClassSubject()
    
    measure {
      for _ in PerformanceTests.iterations {
        subject.value = 0
        subject.otherValue = ""
        subject.value = 0
        subject.otherValue = ""
        subject.value = 0
        subject.otherValue = ""
        subject.value = 0
      }
    }
  }
  
  func testPerformance_setupWithSingleKeyPathSet_onValueType_withoutPrebuildSetup() {
    var subject = StructSubject()
    
    measure {
      for _ in PerformanceTests.iterations {
        Setup.of(StructSubject.self)
          .set(\.value, to: 0)
          .apply(on: &subject)
      }
    }
  }
  
  func testPerformance_setupWithSingleKeyPathSet_onValueType_withPrebuildSetup() {
    let testSetup = Setup.of(StructSubject.self)
      .set(\.value, to: 0)
    
    var subject = StructSubject()
    measure {
      for _ in PerformanceTests.iterations {
        testSetup.apply(on: &subject)
      }
    }
  }
  
  func testPerformance_setupWithSingleKeyPathSet_onReferenceType_withoutPrebuildSetup() {
    var subject = ClassSubject()
    measure {
      for _ in PerformanceTests.iterations {
        Setup.of(ClassSubject.self)
          .set(\.value, to: 0)
          .apply(on: &subject)
      }
    }
  }
  
  func testPerformance_setupWithSingleKeyPathSet_onReferenceType_withPrebuildSetup() {
    let testSetup = Setup.of(ClassSubject.self)
      .set(\.value, to: 0)
    
    var subject = ClassSubject()
    measure {
      for _ in PerformanceTests.iterations {
        testSetup.apply(on: &subject)
      }
    }
  }
  
  func testPerformance_mutationWithSingleKeyPathSet_onValueType_withoutPrebuildSetup() {
    var subject = StructSubject()
    measure {
      for _ in PerformanceTests.iterations {
        Mutation<StructSubject>
          .set(\.value, to: 0)
          .apply(on: &subject)
      }
    }
  }
  
  func testPerformance_mutationWithSingleKeyPathSet_onValueType_withPrebuildSetup() {
    let testSetup = Mutation<StructSubject>
      .set(\.value, to: 0)
    
    var subject = StructSubject()
    measure {
      for _ in PerformanceTests.iterations {
        testSetup.apply(on: &subject)
      }
    }
  }
  
  func testPerformance_mutationWithSingleKeyPathSet_onReferenceType_withoutPrebuildSetup() {
    var subject = ClassSubject()
    measure {
      for _ in PerformanceTests.iterations {
        Mutation<ClassSubject>
          .set(\.value, to: 0)
          .apply(on: &subject)
      }
    }
  }
  
  func testPerformance_mutationWithSingleKeyPathSet_onReferenceType_withPrebuildSetup() {
    let testSetup = Mutation<ClassSubject>
      .set(\.value, to: 0)
    
    var subject = ClassSubject()
    measure {
      for _ in PerformanceTests.iterations {
        testSetup.apply(on: &subject)
      }
    }
  }
  
  func testPerformance_setupWithSingleCustomSet_onValueType_withoutPrebuildSetup() {
    var subject = StructSubject()
    
    measure {
      for _ in PerformanceTests.iterations {
        Setup.of(StructSubject.self)
          .composed { (subject: inout StructSubject) in
            subject.value = 0
          }
          .apply(on: &subject)
      }
    }
  }
  
  func testPerformance_setupWithSingleCustomSet_onValueType_withPrebuildSetup() {
    let testSetup = Setup.of(StructSubject.self)
      .composed { (subject: inout StructSubject) in
        subject.value = 0
      }
    
    var subject = StructSubject()
    measure {
      for _ in PerformanceTests.iterations {
        testSetup.apply(on: &subject)
      }
    }
  }
  
  func testPerformance_setupWithSingleCustomSet_onReferenceType_withoutPrebuildSetup() {
    var subject = ClassSubject()
    measure {
      for _ in PerformanceTests.iterations {
        Setup.of(ClassSubject.self)
          .composed { (subject: ClassSubject) in
            subject.value = 0
          }
          .apply(on: &subject)
      }
    }
  }
  
  func testPerformance_setupWithSingleCustomSet_onReferenceType_withPrebuildSetup() {
    let testSetup = Setup.of(ClassSubject.self)
      .composed { (subject: ClassSubject) in
        subject.value = 0
      }
    
    var subject = ClassSubject()
    measure {
      for _ in PerformanceTests.iterations {
        testSetup.apply(on: &subject)
      }
    }
  }
  
  
  func testPerformance_mutationWithSingleCustomSet_onValueType_withoutPrebuildSetup() {
    var subject = StructSubject()
    measure {
      for _ in PerformanceTests.iterations {
        Mutation<StructSubject>
          .custom { (subject: inout StructSubject) in
            subject.value = 0
          }
          .apply(on: &subject)
      }
    }
  }
  
  func testPerformance_mutationWithSingleCustomSet_onValueType_withPrebuildSetup() {
    let testSetup = Mutation<StructSubject>
      .custom { (subject: inout StructSubject) in
        subject.value = 0
      }
    
    var subject = StructSubject()
    measure {
      for _ in PerformanceTests.iterations {
        testSetup.apply(on: &subject)
      }
    }
  }
  
  func testPerformance_mutationWithSingleCustomSet_onReferenceType_withoutPrebuildSetup() {
    var subject = ClassSubject()
    measure {
      for _ in PerformanceTests.iterations {
        Mutation<ClassSubject>
          .custom { (subject: ClassSubject) in
            subject.value = 0
          }
          .apply(on: &subject)
      }
    }
  }
  
  func testPerformance_mutationWithSingleCustomSet_onReferenceType_withPrebuildSetup() {
    let testSetup = Mutation<ClassSubject>
      .custom { (subject: ClassSubject) in
        subject.value = 0
      }
    
    var subject = ClassSubject()
    measure {
      for _ in PerformanceTests.iterations {
        testSetup.apply(on: &subject)
      }
    }
  }
  
  func testPerformance_setupWithMultipleSteps_onValueType_withoutPrebuildSetup() {
    var subject = StructSubject()
    
    measure {
      for _ in PerformanceTests.iterations {
        Setup.of(StructSubject.self)
          .set(\.value, to: 0)
          .set(\.otherValue, to: "")
          .set(\.value, to: 0)
          .set(\.otherValue, to: "")
          .set(\.value, to: 0)
          .set(\.otherValue, to: "")
          .set(\.value, to: 0)
          .apply(on: &subject)
      }
    }
  }
  
  func testPerformance_setupWithMultipleSteps_onValueType_withPrebuildSetup() {
    let testSetup = Setup.of(StructSubject.self)
      .set(\.value, to: 0)
      .set(\.otherValue, to: "")
      .set(\.value, to: 0)
      .set(\.otherValue, to: "")
      .set(\.value, to: 0)
      .set(\.otherValue, to: "")
      .set(\.value, to: 0)
    
    var subject = StructSubject()
    measure {
      for _ in PerformanceTests.iterations {
        testSetup.apply(on: &subject)
      }
    }
  }
  
  func testPerformance_setupWithMultipleSteps_onReferenceType_withoutPrebuildSetup() {
    var subject = ClassSubject()
    measure {
      for _ in PerformanceTests.iterations {
        Setup.of(ClassSubject.self)
          .set(\.value, to: 0)
          .set(\.otherValue, to: "")
          .set(\.value, to: 0)
          .set(\.otherValue, to: "")
          .set(\.value, to: 0)
          .set(\.otherValue, to: "")
          .set(\.value, to: 0)
          .apply(on: &subject)
      }
    }
  }
  
  func testPerformance_setupWithMultipleSteps_onReferenceType_withPrebuildSetup() {
    let testSetup = Setup.of(ClassSubject.self)
      .set(\.value, to: 0)
      .set(\.otherValue, to: "")
      .set(\.value, to: 0)
      .set(\.otherValue, to: "")
      .set(\.value, to: 0)
      .set(\.otherValue, to: "")
      .set(\.value, to: 0)
    
    var subject = ClassSubject()
    measure {
      for _ in PerformanceTests.iterations {
        testSetup.apply(on: &subject)
      }
    }
  }
  
  
  func testPerformance_mutationWithMultipleSteps_onValueType_withoutPrebuildSetup() {
    var subject = StructSubject()
    measure {
      for _ in PerformanceTests.iterations {
        Mutation<StructSubject>
          .combined(
            .set(\.value, to: 0),
            .set(\.otherValue, to: ""),
            .set(\.value, to: 0),
            .set(\.otherValue, to: ""),
            .set(\.value, to: 0),
            .set(\.otherValue, to: ""),
            .set(\.value, to: 0)
          )
          .apply(on: &subject)
      }
    }
  }
  
  func testPerformance_mutationWithMultipleSteps_onValueType_withPrebuildSetup() {
    let testSetup = Mutation<StructSubject>
      .combined(
        .set(\.value, to: 0),
        .set(\.otherValue, to: ""),
        .set(\.value, to: 0),
        .set(\.otherValue, to: ""),
        .set(\.value, to: 0),
        .set(\.otherValue, to: ""),
        .set(\.value, to: 0)
      )
    
    var subject = StructSubject()
    measure {
      for _ in PerformanceTests.iterations {
        testSetup.apply(on: &subject)
      }
    }
  }
  
  func testPerformance_mutationWithMultipleSteps_onReferenceType_withoutPrebuildSetup() {
    var subject = ClassSubject()
    measure {
      for _ in PerformanceTests.iterations {
        Mutation<ClassSubject>
          .combined(
            .set(\.value, to: 0),
            .set(\.otherValue, to: ""),
            .set(\.value, to: 0),
            .set(\.otherValue, to: ""),
            .set(\.value, to: 0),
            .set(\.otherValue, to: ""),
            .set(\.value, to: 0)
          )
          .apply(on: &subject)
      }
    }
  }
  
  func testPerformance_mutationWithMultipleSteps_onReferenceType_withPrebuildSetup() {
    let testSetup = Mutation<ClassSubject>
      .combined(
        .set(\.value, to: 0),
        .set(\.otherValue, to: ""),
        .set(\.value, to: 0),
        .set(\.otherValue, to: ""),
        .set(\.value, to: 0),
        .set(\.otherValue, to: ""),
        .set(\.value, to: 0)
      )
    
    var subject = ClassSubject()
    measure {
      for _ in PerformanceTests.iterations {
        testSetup.apply(on: &subject)
      }
    }
  }
}

private struct StructSubject {
  
  var value: Int = 42
  var otherValue: String = "answer"
}

private class ClassSubject {
  
  var value: Int = 42
  var otherValue: String = "answer"
}
