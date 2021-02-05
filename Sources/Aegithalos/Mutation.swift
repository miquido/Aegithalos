public struct Mutation<Subject> {
  
  @usableFromInline internal let apply: (inout Subject) -> Void
  
  @usableFromInline internal init(
    _ apply: @escaping (inout Subject) -> Void
  ) {
    self.apply = apply
  }
}

public extension Mutation {

  @inline(__always) func callAsFunction(
    _ subject: inout Subject
  ) {
    self.apply(&subject)
  }
  
  @inlinable func contramap<OtherSubject>(
    _ keyPath: WritableKeyPath<OtherSubject, Subject>
  ) -> Mutation<OtherSubject> {
    Mutation<OtherSubject> { otherSubject in
      self.apply(&otherSubject[keyPath: keyPath])
    }
  }
  
  @inlinable func contramapOptional() -> Mutation<Optional<Subject>> {
    Mutation<Optional<Subject>> { optionalSubject in
      guard var subject = optionalSubject else { return }
      self.apply(&subject)
      optionalSubject = subject
    }
  }
  
  @inlinable static var none: Self { Self { _ in } }
  
  @inlinable static func custom(
    _ mutation: @escaping (inout Subject) -> Void
  ) -> Mutation<Subject> {
    Self { subject in mutation(&subject) }
  }
  
  @inlinable static func combined(
    _ mutations: Mutation<Subject>...
  ) -> Mutation<Subject> {
    Self { subject in mutations.forEach { $0.apply(&subject) } }
  }
  
  @inlinable static func set<Value>(
    _ kayPath: WritableKeyPath<Subject, Value>,
    to value: Value
  ) -> Self {
    Self { subject in subject[keyPath: kayPath] = value }
  }
  
  @inlinable static func when(
    _ condition: Bool,
    then mutation: Mutation<Subject>,
    else fallback: Mutation<Subject> = .none
  ) -> Mutation<Subject> {
    Self { subject in
      if condition {
        mutation.apply(&subject)
      } else {
        fallback.apply(&subject)
      }
    }
  }
  
  @inlinable static func whenSome<Value>(
    _ optional: Optional<Value>,
    then mutation: @escaping (Value) -> Mutation<Subject>,
    else fallback: Mutation<Subject> = .none
  ) -> Mutation<Subject> {
    Self { subject in
      if let some = optional {
        mutation(some).apply(&subject)
      } else {
        fallback.apply(&subject)
      }
    }
  }
  
  @inlinable static func with<Variable>(
    _ variable: @escaping () -> Variable,
    _ mutation: @escaping (Variable) -> Mutation<Subject>
  ) -> Mutation<Subject> {
    Self { subject in
      mutation(variable()).apply(&subject)
    }
  }
}

public extension Mutation where Subject: AnyObject {
  
  @inline(__always) func callAsFunction(
    _ subject: Subject
  ) {
    apply(subject)
  }
  
  @inlinable func contramap<OtherSubject>(
    _ keyPath: ReferenceWritableKeyPath<OtherSubject, Subject>
  ) -> Mutation<OtherSubject> {
    Mutation<OtherSubject> { otherSubject in self(otherSubject[keyPath: keyPath]) }
  }
  
  @inlinable static func custom(
    _ mutation: @escaping (Subject) -> Void
  ) -> Mutation<Subject> {
    Self { subject in mutation(subject) }
  }
  
  @inlinable static func set<Value>(
    _ kayPath: ReferenceWritableKeyPath<Subject, Value>,
    to value: Value
  ) -> Self {
    Self { subject in subject[keyPath: kayPath] = value }
  }
}

internal extension Mutation where Subject: AnyObject {
  
  @usableFromInline @inline(__always) func apply(
    _ subject: Subject
  ) {
    var subject = subject // reference itself won't be mutated anyway
    self.apply(&subject)
  }
}

@_functionBuilder
public struct MutationBuilder {
  
  public static func buildBlock<Subject>(
    _ mutations: Mutation<Subject>...
  ) -> Mutation<Subject> {
    Mutation<Subject> { subject in mutations.forEach { $0.apply(&subject) } }
  }
}

public extension Mutation {
  
  init(
    @MutationBuilder _ builder: () -> Self
  ) {
    self = builder()
  }
}

@inline(__always) public func mut<Subject>(
  _ subject: inout Subject,
  _ mutationBuilder: () -> Mutation<Subject>
) {
  mutationBuilder().apply(&subject)
}

@inline(__always) public func mut<Subject>(
  _ subject: Subject,
  _ mutationBuilder: () -> Mutation<Subject>
) where Subject: AnyObject {
  mutationBuilder().apply(subject)
}

@inline(__always) public func mut<Subject>(
  of subjectType: Subject.Type = Subject.self,
  _ mutationBuilder: () -> Mutation<Subject>
) -> Mutation<Subject> {
  mutationBuilder()
}

public protocol EmptyInstantiable {
  
  init()
}

public extension Mutation where Subject: EmptyInstantiable {
  
  @inlinable func instantiate() -> Subject {
    var subject = Subject()
    self.apply(&subject)
    return subject
  }
}

#if DEBUG
public extension Mutation {
  
  @inlinable static func assert(
    _ assertion: @escaping (Subject) -> Bool,
    message: String = "Assertion failure"
  ) -> Mutation<Subject> {
    Self { subject in Swift.assert(assertion(subject), message) }
  }
  
}
#endif

#if canImport(Dispatch)
import enum Dispatch.DispatchPredicate
import func Dispatch.dispatchPrecondition

public extension Mutation {
  
  @inlinable static func dispatchPrecondition(
    _ predicate: DispatchPredicate
  ) -> Mutation<Subject> {
    Self { _ in Dispatch.dispatchPrecondition(condition: predicate) }
  }
}
#endif

#if canImport(Combine)
@available(OSX 10.15, iOS 13.0, *)
public extension Mutation {
  
  @inline(__always) func callAsFunction(
    _ stateSubject: State<Subject>
  ) {
    apply(stateSubject)
  }
  
  @inlinable func contramapState() -> Mutation<State<Subject>> {
    Mutation<State<Subject>> { stateSubject in
      apply(stateSubject)
    }
  }
}

@available(OSX 10.15, iOS 13.0, *)
internal extension Mutation {
  
  @usableFromInline @inline(__always) func apply(
    _ stateSubject: State<Subject>
  ) {
    var stateValue = stateSubject.value
    self.apply(&stateValue) // multiple state mutations will appear as single published value
    stateSubject.value = stateValue
  }
}

@available(OSX 10.15, iOS 13.0, *)
@inline(__always) public func mut<Subject>(
  _ subject: State<Subject>,
  _ mutationBuilder: () -> Mutation<Subject>
) where Subject: AnyObject {
  mutationBuilder().apply(subject)
}

#endif
