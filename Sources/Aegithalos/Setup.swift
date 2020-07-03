/// Wrapper for a function allowing mutation of passed subject.
/// Can be composed with other `Setup`  instances and suitable functions.
/// Allows contramapping for more extensible composition.
/// - note: `Setup` behaves differently on value and reference types.
/// Depending on exact `Subject` type it requires reference for class instances,
/// or mutable reference for enums and structs. This allows to wrap mutating functions
/// operating on class instances without inout requirement. For value types it is required to
/// have inout argument.
/// - note: You can provide fluent API for given `Subject` by preparing extension for `Setup`
/// with given `Subject` constraint and using `compose` method.
public struct Setup<Subject> {
  
  /// Wrapped function.
  @usableFromInline internal let setup: (inout Subject) -> Void
  
  /// Internal initializer for value types.
  @usableFromInline internal init(setup: @escaping (inout Subject) -> Void) {
    self.setup = setup
  }
}

// MARK: - Value types

public extension Setup {
  
  /// Type specifying instance of `Setup`. Does not apply any mutation by default allowing further composition.
  /// - parameter setup: Mutation function wrapped by this `Setup`. Empty function by default.
  /// - note: It is preffered to prepare `Setup` and specify `Subject` type by using this function
  /// instead of explicit type specification. `Setup.of(SomeType.self)` is preffered over `Setup<SomeType>`.
  static func of(
    _: Subject.Type,
    _ setup: @escaping (inout Subject) -> Void = { _ in }
  ) -> Setup {
    .init(setup: setup)
  }
  
  /// Call wrapped function on given `Subject` instance.
  /// - returns: New `Subject` instance that was created after applying mutations on passed subject.
  /// - warning: If `Subject` is a reference type there will be no copy created
  /// and all mutations will be applied on passed instance directly.
  @inlinable func callAsFunction(appliedOn subject: Subject) -> Subject {
    var subject = subject
    setup(&subject)
    return subject
  }
  
  /// Call wrapped function on given `Subject` instance reference.
  /// - returns: Same `Subject` instance that was passed as argument.
  @inlinable func callAsFunction(appliedOn subject: inout Subject) -> Subject {
    setup(&subject)
    return subject
  }
  
  /// Call wrapped function on given `Subject` instance reference.
  /// - returns: Same `Setup` instance.
  @discardableResult @inlinable func callAsFunction(applyOn subject: inout Subject) -> Self {
    setup(&subject)
    return self
  }
  
  /// Extend this `Setup` by composing it with another function.
  /// - parameter other: Function composed with this `Setup`.
  /// - returns: New `Setup` instance which composes this one with given function.
  @inlinable func composed(with other: @escaping (inout Subject) -> Void) -> Self {
    .init { subject in
      self(applyOn: &subject)
      other(&subject)
    }
  }
  
  /// Extend this `Setup` by composing it with list of functions.
  /// - parameter other: List of functions composed with this `Setup`.
  /// - returns: New `Setup` instance which composes this one with given list of functions.
  @inlinable func composed(with other: (inout Subject) -> Void...) -> Self {
    .init { subject in
      self(applyOn: &subject)
      other.forEach { $0(&subject) }
    }
  }
  
  /// Extend this `Setup` by composing it with another `Setup`.
  /// - parameter other: Other `Setup` composed with this one.
  /// - returns: New `Setup` instance which composes this one with the other one.
  @inlinable func composed(with other: Self) -> Self {
    composed(with: other.setup)
  }
  
  /// Extend this `Setup` by composing it with list of `Setup` instances.
  /// - parameter other: List of other `Setup` instances composed with this one.
  /// - returns: New `Setup` instance which composes this one with list of other `Setup` instances.
  @inlinable func composed(with other: Self...) -> Self {
    composed { subject in
      other.forEach { $0(applyOn: &subject) }
    }
  }
  
  /// Map `Subject` type to other type. This allows applying same `Setup` on
  /// other types that encapsulate instance of original `Subject` type.
  /// - parameter keyPath: KeyPath used to provide mapping. It has to point to mutable value of
  /// original `Subject` type inside new `Subject` type.
  /// - returns: New `Setup` instance applying this one on other `Subject` type.
  @inlinable func contramap<OtherSubject>(
    _ keyPath: WritableKeyPath<OtherSubject, Subject>
  ) -> Setup<OtherSubject> {
    .init { (otherSubject: inout OtherSubject) in
      self(applyOn: &otherSubject[keyPath: keyPath])
    }
  }
}

// MARK: - Reference types

public extension Setup where Subject: AnyObject {
  
  /// Internal initializer for reference types.
  @usableFromInline internal init(setup: @escaping (Subject) -> Void) {
    self.setup = { setup($0) }
  }
  
  /// Call wrapped function on given `Subject` instance reference.
  /// - returns: Same `Setup` instance.
  @discardableResult @inlinable func callAsFunction(applyOn subject: Subject) -> Self {
    var subject = subject
    setup(&subject)
    return self
  }
  
  /// Map `Subject` type to other type. This allows applying same `Setup` on
  /// other types that encapsulate instance of original `Subject` type.
  /// - parameter transform: Function used to provide mapping. It has to point to value of
  /// original `Subject` type inside new `Subject` type.
  /// - returns: New `Setup` instance applying this one on other `Subject` type.
  @inlinable func contramap<OtherSubject>(
    _ transform: @escaping (OtherSubject) -> Subject
  ) -> Setup<OtherSubject>
  where OtherSubject: AnyObject {
    .init { (otherSubject: OtherSubject) in
      self(applyOn: transform(otherSubject))
    }
  }
  
  /// Map `Subject` type to other type. This allows applying same `Setup` on
  /// other types that encapsulate instance of original `Subject` type.
  /// - parameter keyPath: KeyPath used to provide mapping. It has to point to value of
  /// original `Subject` type inside new `Subject` type.
  /// - returns: New `Setup` instance applying this one on other `Subject` type.
  @inlinable func contramap<OtherSubject>(
    _ keyPath: KeyPath<OtherSubject, Subject>
  ) -> Setup<OtherSubject>
  where OtherSubject: AnyObject {
    .init { (otherSubject: inout OtherSubject) in
      self(applyOn: otherSubject[keyPath: keyPath])
    }
  }
}

// MARK: - Function builder

public extension Setup {
  
  /// Function builder initializer. Allows initialization from list of functions.
  init(@SetupBuilder _ builder: () -> Self) {
    self = builder()
  }
}

/// Function builder for `Setup`.
@_functionBuilder
public enum SetupBuilder {
  
  /// Function builder for  `Subject` as value type.
  public static func buildBlock<Subject>(
    _ setup: (inout Subject) -> Void...
  ) -> Setup<Subject> {
    Setup { (subject: inout Subject) in setup.forEach { $0(&subject) } }
  }
  
  /// Function builder for `Subject` as reference type.
  public static func buildBlock<Subject>(
    _ setup: (Subject) -> Void...
  ) -> Setup<Subject>
  where Subject: AnyObject {
    Setup { (subject: Subject) in setup.forEach { $0(subject) } }
  }
}

// MARK: - Operators

infix operator <=<: SetupPrecedence

precedencegroup SetupPrecedence {
  higherThan: SetupComposePrecedence
}

/// Operator which creates `Setup` instance for given keyPath
/// as mutation assigning given falue to that keyPath.
@inlinable public func <=< <Subject, Value>(
  _ lhs: WritableKeyPath<Subject, Value>,
  _ rhs: Value
) -> Setup<Subject> {
  Setup { subject in
    subject[keyPath: lhs] = rhs
  }
}

/// Operator which creates  mutating function for given keyPath
/// as mutation assigning given falue to that keyPath.
@inlinable public func <=< <Subject, Value>(
  _ lhs: WritableKeyPath<Subject, Value>,
  _ rhs: Value
) -> (inout Subject) -> Void {
  { subject in
    subject[keyPath: lhs] = rhs
  }
}

/// Operator which creates  mutating function for given keyPath
/// as mutation assigning given falue to that keyPath.
@inlinable public func <=< <Subject, Value>(
  _ lhs: WritableKeyPath<Subject, Value>,
  _ rhs: Value
) -> (Subject) -> Void
where Subject: AnyObject {
  { subject in
    var subject = subject // compiler requires subject to be mutable regarding AnyObject usage
    subject[keyPath: lhs] = rhs
  }
}

infix operator <>: SetupComposePrecedence

precedencegroup SetupComposePrecedence {
  higherThan: AssignmentPrecedence
}

/// Compose two `Setup` instances.
/// - returns: New `Setup` instance composing provided two.
@inlinable public func <> <Subject>(
  _ lhs: Setup<Subject>,
  _ rhs: Setup<Subject>
) -> Setup<Subject> {
  lhs.composed(with: rhs)
}
