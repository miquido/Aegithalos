/// Wrapper for a mutationg function which can be applied on suitable subject instance.
/// - note: `Mutation` behaves slightly differently on value and reference types accordingly to its properties.
public struct Mutation<Subject> {
  
  /// Wrapped function.
  @usableFromInline internal let apply: (inout Subject) -> Void
  
  @usableFromInline internal init(
    _ apply: @escaping (inout Subject) -> Void
  ) {
    self.apply = apply
  }
}

public extension Mutation {
  
  /// Apply mutation on provided subject mutating it in place.
  /// - parameter subject: Subject on which mutation will be applied.
  /// - warning: This method is not suitable for reference types.
  @inline(__always) func apply(
    on subject: inout Subject
  ) {
    precondition(!(Subject.self is AnyObject.Type), "Reference types are not supported by this method")
    apply(&subject)
  }
  
  /// Apply mutation on provided subject mutating its copy.
  /// - parameter subject: Subject which copy will be mutatated.
  /// - returns: Copy of provided subject with mutation applied.
  /// - warning: This method is not suitable for reference types.
  @inline(__always) func applied(
    on subject: Subject
  ) -> Subject {
    precondition(!(Subject.self is AnyObject.Type), "Reference types are not supported by this method")
    var subject = subject
    apply(&subject)
    return subject
  }
  
  /// Map `Mutation` to other type enclosing current Subject.
  /// - parameter keyPath: KeyPath used to provide mapping. It has to point to mutable value of
  /// original `Subject` type inside new `Subject` type.
  /// - returns: New instance of `Mutation` operating on mapped subject.
  @inlinable func contramap<OtherSubject>(
    _ keyPath: WritableKeyPath<OtherSubject, Subject>
  ) -> Mutation<OtherSubject> {
    Mutation<OtherSubject> { otherSubject in
      self.apply(&otherSubject[keyPath: keyPath])
    }
  }
  
  /// Map `Mutation` to optional subjects.
  /// - returns: New instance of `Mutation` operating on optional subject.
  @inlinable func contramapOptional() -> Mutation<Optional<Subject>> {
    Mutation<Optional<Subject>> { optionalSubject in
      guard var subject = optionalSubject else { return }
      self.apply(&subject)
      optionalSubject = subject
    }
  }
  
  /// Empty mutation.
  @inline(__always) static var none: Self { Self { _ in } }
  
  /// Create custom mutation by providing closure operating on subject.
  /// - parameter mutation: Function that will be wrapped into `Mutation`.
  /// - returns: New instance of `Mutation` enclosing provided closure.
  @inline(__always) static func custom(
    _ mutation: @escaping (inout Subject) -> Void
  ) -> Mutation<Subject> {
    precondition(!(Subject.self is AnyObject.Type), "Reference types are not supported by this method")
    return Self { subject in mutation(&subject) }
  }
  
  /// Combine multiple `Mutation` into single one.
  /// - parameter mutations: List of `Mutation` that will be combined into a single one.
  /// - returns: New instance of `Mutation` combining all provided mutations.
  /// - note: Mutations will be applied in same order as provided in argument list.
  @inlinable static func combined(
    _ mutations: Mutation<Subject>...
  ) -> Mutation<Subject> {
    Self { subject in
      // iteration on raw pointers is much faster than using iterators or forEach
      mutations.withUnsafeBufferPointer { ptr -> Void in
        var idx = 0
        let count = ptr.count
        while idx < count {
          ptr[idx].apply(on: &subject)
          idx = idx + 1
        }
      }
    }
  }
  
  /// Crate `Mutation` of setting given value throug key path.
  /// - parameter keyPath: Key path of mutated field.
  /// - parameter value: Value set on given key path.
  /// - returns: New instance of `Mutation` setting given value using provided key path.
  @inline(__always) static func set<Value>(
    _ kayPath: WritableKeyPath<Subject, Value>,
    to value: Value
  ) -> Self {
    Self { subject in subject[keyPath: kayPath] = value }
  }
  
  /// Create conditional `Mutation` applied only when condition evaluates to true.
  /// - parameter condition: Condition checked to conditionally apply `Mutation`.
  /// - parameter mutation: `Mutation` applied when condition evaluates to true.
  /// - parameter fallback: `Mutation` applied when condition evaluates to false. Default is `.none`.
  /// - returns: New instance of `Mutation` with conditional application.
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
  
  /// Create conditional `Mutation` applied only when condition evaluates to some value (Optional.some).
  /// - parameter optional: Optional value used to conditionally apply `Mutation`.
  /// - parameter mutation: `Mutation` applied when optional evaluates to some value (Optional.some).
  /// - parameter fallback: `Mutation` applied when optional evaluates to none (Optional.none). Default is `.none`.
  /// - returns: New instance of `Mutation` with conditional application.
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
  
  /// Create `Mutation` with dynamic variable.
  /// - parameter variable: Closure returning given `Variable`. Will be called on each application of created `Mutation`.
  /// - parameter mutation: Closure returning `Mutation` with access to result of variable closure call. Will be called on each application of created `Mutation`.
  /// - returns: New instance of `Mutation` with dynamic variable on each application.
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
  
  /// Apply mutation on provided subject mutating it in place.
  /// - parameter subject: Subject on which mutation will be applied.
  @inline(__always) func apply(
    on subject: Subject
  ) {
    apply(subject)
  }
  
  /// Map `Mutation` to other type enclosing current Subject.
  /// - parameter keyPath: KeyPath used to provide mapping. It has to point to mutable value of
  /// original `Subject` type inside new `Subject` type.
  @inlinable func contramap<OtherSubject>(
    _ keyPath: ReferenceWritableKeyPath<OtherSubject, Subject>
  ) -> Mutation<OtherSubject> {
    Mutation<OtherSubject> { otherSubject in self.apply(otherSubject[keyPath: keyPath]) }
  }
  
  /// Create custom mutation by providing closure operating on subject.
  /// - parameter mutation: Function that will be wrapped into `Mutation`.
  /// - returns: New instance of `Mutation` enclosing provided closure.
  @inline(__always) static func custom(
    _ mutation: @escaping (Subject) -> Void
  ) -> Mutation<Subject> {
    Self { subject in mutation(subject) }
  }
  
  /// Crate `Mutation` of setting given value throug key path.
  /// - parameter keyPath: Key path of mutated field.
  /// - parameter value: Value set on given key path.
  /// - returns: New instance of `Mutation` setting given value using provided key path.
  @inline(__always) static func set<Value>(
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
    Mutation<Subject> { subject in
      // iteration on raw pointers is much faster than using iterators or forEach
      mutations.withUnsafeBufferPointer { ptr -> Void in
        var idx = 0
        let count = ptr.count
        while idx < count {
          ptr[idx].apply(on: &subject)
          idx = idx + 1
        }
      }
    }
  }
}

public extension Mutation {
  
  /// Create `Mutation` by combinind provided mutations.
  /// - parameter mutationBuilder: Block called to priovide mutations combined for new `Mutation`.
  init(
    @MutationBuilder _ mutationBuilder: () -> Self
  ) {
    self = mutationBuilder()
  }
}

/// Mutate given subject by applying provided mutation.
/// - parameter subject: Subject that will be used for application of `Mutation`.
/// - parameter mutationBuilder: Block called to provide `Mutation` applied on passed subject.
@inline(__always) public func mut<Subject>(
  _ subject: inout Subject,
  _ mutationBuilder: () -> Mutation<Subject>
) {
  precondition(!(Subject.self is AnyObject.Type), "Reference types are not supported by this function")
  mutationBuilder().apply(&subject)
}

/// Mutate given subject by applying provided mutation.
/// - parameter subject: Subject that will be used for application of `Mutation`.
/// - parameter mutationBuilder: Block called to provide `Mutation` applied on passed subject.
@inline(__always) public func mut<Subject>(
  _ subject: Subject,
  _ mutationBuilder: () -> Mutation<Subject>
) where Subject: AnyObject {
  mutationBuilder().apply(subject)
}

/// Protocol used to provide types that are possible to create without arguments.
public protocol EmptyInstantiable {
  
  init()
}

public extension Mutation where Subject: EmptyInstantiable {
  
  /// Create new instance of `Subject` through `EmptyInstantiable` protocol and apply this `Mutation` on it.
  /// - returns: New instance of `Subject` after aplication of this `Mutation`.
  @inlinable @discardableResult func instantiate() -> Subject {
    var subject = Subject()
    self.apply(&subject)
    return subject
  }
}

public extension Mutation {
  
  /// Create new instance of `Mutation` which asserts given condition based on `Subject` state.
  /// It can be used to verify state of subject when applying `Mutation`.
  /// - returns: New instance of `Mutation` with assertion.
  /// - note: Assertions are applied only in debug builds. It has no effect on release builds.
  /// - warning: It should not mutate `Subject`.
  @inlinable static func assert(
    _ assertion: @escaping (Subject) -> Bool,
    message: String = "Assertion failure"
  ) -> Mutation<Subject> {
    #if DEBUG
    return Self { subject in Swift.assert(assertion(subject), message) }
    #else
    return .none
    #endif
  }
}

#if canImport(Dispatch)
import enum Dispatch.DispatchPredicate
import func Dispatch.dispatchPrecondition

public extension Mutation {
  
  /// Create new instance of `Mutation` with dispatch preconditon.
  /// It can be used to verify dispatch queue used when applying `Mutation`.
  /// Does not mutate `Subject`.
  /// - parameter predicate: `DispatchPredicate` used for precondition.
  /// - returns: New instance of `Mutation` with dispatch preconditon.
  /// - note: Assertions are applied only in debug builds. It has no effect on release builds.
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
  
  /// Apply mutation on subject wrapped in provided `State`.
  /// - parameter subject: Subject on which mutation will be applied.
  /// - note: It will trigger `State` observers only once.
  /// - warning: Method is not protected from race conditions (should be thread safe although).
  @inline(__always) func apply(
    on stateSubject: State<Subject>
  ) {
    apply(stateSubject)
  }
  
  /// Map `Mutation` to optional states.
  /// - returns: New instance of `Mutation` operating on subject wrapped in `State`.
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

/// Mutate subject wrapped in provided `State` by applying provided mutation.
/// - parameter subject: `State` which value will be used for application of `Mutation`.
/// - parameter mutationBuilder: Block called to provide `Mutation` applied on passed `State`.
@available(OSX 10.15, iOS 13.0, *)
@inline(__always) public func mut<Subject>(
  _ subject: State<Subject>,
  _ mutationBuilder: () -> Mutation<Subject>
) where Subject: AnyObject {
  mutationBuilder().apply(subject)
}

#endif
