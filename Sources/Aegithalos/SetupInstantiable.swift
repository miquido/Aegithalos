/// Protocol that allows making new instances of subjects directly from `Setup`.
public protocol SetupInstantiable {
  
  /// Create new instance of `Self` suitable for application of `Setup`.
  /// - returns: New instance of `Self` prepared for being setup.
  /// - warning: Do not reuse same instance of `Self`, it will be mutated on each use of `Setup`.
  static func instantiateForSetup() -> Self
}

public extension Setup where Subject: SetupInstantiable {
  
  /// Create new instance of `Subject` applying this setup.
  /// - returns: New instance of `Subject` after setup.
  @inlinable func instantiate() -> Subject {
    callAsFunction()
  }

  /// Create new instance of `Subject` applying this setup.
  /// - returns: New instance of `Subject` after setup.
  @inlinable func callAsFunction() -> Subject {
    self(appliedOn: Subject.instantiateForSetup())
  }
}
