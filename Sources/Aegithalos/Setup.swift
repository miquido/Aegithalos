public struct Setup<Subject> {
  
  @usableFromInline internal let setup: (inout Subject) -> Void
  
  @usableFromInline internal init(setup: @escaping (inout Subject) -> Void) {
    self.setup = setup
  }
  
  public static func of(
    _: Subject.Type,
    _ setup: @escaping (inout Subject) -> Void = { _ in }
  ) -> Setup {
    .init(setup: setup)
  }
  
  @inlinable public func callAsFunction(appliedOn subject: inout Subject) -> Subject {
    setup(&subject)
    return subject
  }
  
  @discardableResult @inlinable public func callAsFunction(applyOn subject: inout Subject) -> Self {
    setup(&subject)
    return self
  }
  
  @inlinable public func composed(with other: @escaping (inout Subject) -> Void) -> Self {
    .init { subject in
      self(applyOn: &subject)
      other(&subject)
    }
  }
  
  @inlinable public func composed(with other: (inout Subject) -> Void...) -> Self {
    .init { subject in
      self(applyOn: &subject)
      other.forEach { $0(&subject) }
    }
  }
  
  @inlinable public func composed(with other: Self) -> Self {
    composed(with: other.setup)
  }
  
  @inlinable public func composed(with other: Self...) -> Self {
    composed { subject in
      other.forEach { $0(applyOn: &subject) }
    }
  }
  
  @inlinable func contramap<OtherSubject>(
    _ keyPath: WritableKeyPath<OtherSubject, Subject>
  ) -> Setup<OtherSubject> {
    .init { (otherSubject: inout OtherSubject) in
      self(applyOn: &otherSubject[keyPath: keyPath])
    }
  }
}

// MARK: - AnyObject

public extension Setup where Subject: AnyObject {
  
  @usableFromInline internal init(setup: @escaping (Subject) -> Void) {
    self.setup = { setup($0) }
  }
  
  @inlinable func callAsFunction(appliedOn subject: Subject) -> Subject {
    var subject = subject
    setup(&subject)
    return subject
  }
  
  @discardableResult @inlinable func callAsFunction(applyOn subject: Subject) -> Self {
    var subject = subject
    setup(&subject)
    return self
  }
  
  @inlinable func contramap<OtherSubject>(
    _ transform: @escaping (OtherSubject) -> Subject
  ) -> Setup<OtherSubject>
  where OtherSubject: AnyObject {
    .init { (otherSubject: OtherSubject) in
      self(applyOn: transform(otherSubject))
    }
  }
}

// MARK: - function builder

public extension Setup {
  
  init(@SetupBuilder _ builder: () -> Self) {
    self = builder()
  }
}

@_functionBuilder
public enum SetupBuilder {
  
  public static func buildBlock<Subject>(
    _ setup: (inout Subject) -> Void...
  ) -> Setup<Subject> {
    Setup { (subject: inout Subject) in setup.forEach { $0(&subject) } }
  }

  public static func buildBlock<Subject>(
    _ setup: (Subject) -> Void...
  ) -> Setup<Subject>
  where Subject: AnyObject {
    Setup { (subject: Subject) in setup.forEach { $0(subject) } }
  }
}

// MARK: - experimental

infix operator <=<: SetupPrecedence

precedencegroup SetupPrecedence {
  higherThan: SetupComposePrecedence
}

@inlinable public func <=< <Subject, Value>(
  _ lhs: WritableKeyPath<Subject, Value>,
  _ rhs: Value
) -> Setup<Subject> {
  Setup { subject in
    subject[keyPath: lhs] = rhs
  }
}

@inlinable public func <=< <Subject, Value>(
  _ lhs: WritableKeyPath<Subject, Value>,
  _ rhs: Value
) -> (inout Subject) -> Void {
  { subject in
    subject[keyPath: lhs] = rhs
  }
}

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

@inlinable public func <> <Subject>(
  _ lhs: Setup<Subject>,
  _ rhs: Setup<Subject>
) -> Setup<Subject> {
  lhs.composed(with: rhs)
}
