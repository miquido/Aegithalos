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
  @inlinable static func of(
    _: Subject.Type,
    _ setup: @escaping (inout Subject) -> Void = { _ in }
  ) -> Setup {
    .init(setup: setup)
  }
  
  /// Instantly applied `Setup` with predefined subject. Allows ad hoc preparation and application of `Setup`.
  /// - parameter subject: Subject on which this setup will be applied on. Mutations will be applied directly on subject.
  /// - parameter setup: Function allowing specification of `Setup` instance that will be applied on subject.
  /// `Setup` instance passed as argument is empty instance for fluent api application, might be ignored otherwise.
  /// - warning: `Setup` instance used as setup function argument is not ment to be used outside of this function.
  @inlinable static func on(_ subject: inout Subject, _ setup: (Setup) -> Setup) {
    setup(Setup.of(Subject.self)).apply(on: &subject)
  }
  
  /// Instantly applied `Setup` with predefined subject. Allows ad hoc preparation and application of `Setup`.
  /// - parameter subject: Subject from which this setup will start. Mutations will generate copies of subject.
  /// - parameter setup: Function allowing specification of `Setup` instance that will be applied on subject.
  /// `Setup` instance passed as argument is empty instance for fluent api application, might be ignored otherwise.
  /// - returns: `Subject` instance that is copy of subject passed as argument with all setup functions applied.
  /// - warning: `Setup` instance used as setup function argument is not ment to be used outside of this function.
  @inlinable static func from(_ subject: Subject, _ setup: (Setup) -> Setup) -> Subject {
    setup(Setup.of(Subject.self)).applied(on: subject)
  }
  
  /// Call wrapped function on given `Subject` instance.
  /// - returns: New `Subject` instance that was created after applying mutations on passed subject.
  /// - warning: If `Subject` is a reference type there will be no copy created
  /// and all mutations will be applied on passed instance directly.
  @inlinable func applied(on subject: Subject) -> Subject {
    self(appliedOn: subject)
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
  /// - returns: Same `Setup` instance.
  @discardableResult @inlinable func apply(on subject: inout Subject) -> Self {
    self(applyOn: &subject)
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
  
  /// Extend this `Setup` by composing it with another `Setup`.
  /// - parameter other: Other `Setup` composed with this one.
  /// - returns: New `Setup` instance which composes this one with the other one.
  @inlinable func composed(with other: Self) -> Self {
    composed(with: other.setup)
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
  
  /// Instantly applied `Setup` with predefined subject. Allows ad hoc preparation and application of `Setup`.
  /// - parameter subject: Subject on which this setup will be applied on. Mutations will be applied directly on subject.
  /// - parameter setup: Function allowing specification of `Setup` instance that will be applied on subject.
  /// `Setup` instance passed as argument is empty instance for fluent api application, might be ignored otherwise.
  /// - warning: `Setup` instance used as setup function argument is not ment to be used outside of this function.
  @inlinable static func on(_ subject: Subject, _ setup: (Setup) -> Setup) {
    setup(Setup.of(Subject.self)).apply(on: subject)
  }
  
  /// Internal initializer for reference types.
  @usableFromInline internal init(setup: @escaping (Subject) -> Void) {
    self.setup = { setup($0) }
  }
  
  /// Call wrapped function on given `Subject` instance reference.
  /// - returns: Same `Setup` instance.
  @discardableResult @inlinable func apply(on subject: Subject) -> Self {
    self(applyOn: subject)
  }
  
  /// Call wrapped function on given `Subject` instance reference.
  /// - returns: Same `Setup` instance.
  @discardableResult @inlinable func callAsFunction(applyOn subject: Subject) -> Self {
    var subject = subject
    setup(&subject)
    return self
  }
  
  /// Extend this `Setup` by composing it with another function.
  /// - parameter other: Function composed with this `Setup`.
  /// - returns: New `Setup` instance which composes this one with given function.
  @inlinable func composed(with other: @escaping (Subject) -> Void) -> Self {
    .init { (subject: Subject) in
      self(applyOn: subject)
      other(subject)
    }
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
