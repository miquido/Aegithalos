/// Conditionally execute one of two functions and get result. Both functions have to return same type.
/// - parameter condition: Condition checked to determine which function will be selected.
/// - parameter then: Function executed when condition evaluates to true.
/// - parameter else: Function executed when condition evaluates to false.
/// - returns: Result of either function.
@discardableResult public func when<T>(
  _ condition: @autoclosure () -> Bool,
  then: () throws -> T,
  else: () throws -> T
) rethrows -> T {
  switch condition() {
  case true:
    return try then()
  case false:
    return try `else`()
  }
}

/// Conditionally execute  function.
/// - parameter condition: Condition checked to determine if function will be executed.
/// - parameter then: Function executed when condition evaluates to true.
public func when(
  _ condition: @autoclosure () -> Bool,
  then: () throws -> Void
) rethrows {
  switch condition() {
  case true:
    return try then()
  case false:
    return ()
  }
}

/// Conditionally execute one of two functions and get result. Both functions have to return same type.
/// - parameter condition: condition checked to determine which function will be selected.
/// - parameter then: Function executed when condition evaluates to false.
/// - parameter else: Function executed when condition evaluates to true.
/// - returns: Result of either function.
@discardableResult public func whenNot<T>(
  _ condition: @autoclosure () -> Bool,
  then: () throws -> T,
  else: () throws -> T
) rethrows -> T {
  switch !condition() {
  case true:
    return try then()
  case false:
    return try `else`()
  }
}

/// Conditionally execute  function.
/// - parameter condition: Condition checked to determine if function will be executed.
/// - parameter then: Function executed when condition evaluates to false.
public func whenNot(
  _ condition: @autoclosure () -> Bool,
  then: () throws -> Void
) rethrows {
  switch !condition() {
  case true:
    return try then()
  case false:
    return ()
  }
}

public extension Bool {
  
  /// Conditionally execute  function if true.
  /// - parameter closure: Function executed when true
  /// - returns: .Self
  @discardableResult func whenTrue(_ closure: () throws -> Void) rethrows -> Self {
    switch self {
    case true:
      try closure()
    case false:
      break
    }
    return self
  }
  
  /// Conditionally execute  function if false.
  /// - parameter closure: Function executed when false
  /// - returns: .Self
  @discardableResult func whenFalse(_ closure: () throws -> Void) rethrows -> Self {
    switch self {
    case true:
      break
    case false:
      try closure()
    }
    return self
  }
}

public extension Optional {
  
  /// Conditionally execute  function if wrapped value is present.
  /// - parameter closure: Function executed with access to wrapped value if any.
  /// - returns: .Self
  @discardableResult func whenSome(_ closure: (Wrapped) throws -> Void) rethrows -> Self {
    switch self {
    case let .some(wrapped):
      try closure(wrapped)
    case .none:
      break
    }
    return self
  }
  
  /// Conditionally execute  function if wrapped value is not present.
  /// - parameter closure: Function executed if there is no value.
  /// - returns: .Self
  @discardableResult func whenNone(_ closure: () throws -> Void) rethrows -> Self {
    switch self {
    case .some:
      break
    case .none:
      try closure()
    }
    return self
  }
}

public extension Result {
  
  /// Conditionally execute  function on success.
  /// - parameter closure: Function executed with access to success value if succeeded.
  /// - returns: .Self
  @discardableResult func whenSuccess(_ closure: (Success) throws -> Void) rethrows -> Self {
    switch self {
    case let .success(success):
      try closure(success)
    case .failure:
      break
    }
    return self
  }
  
  /// Conditionally execute  function on failure.
  /// - parameter closure: Function executed with access to error if failed.
  /// - returns: .Self
  @discardableResult func whenFailure(_ closure: (Failure) throws -> Void) rethrows -> Self {
    switch self {
    case .success:
      break
    case let .failure(failure):
      try closure(failure)
    }
    return self
  }
}
