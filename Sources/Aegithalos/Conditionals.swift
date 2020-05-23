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
  @discardableResult func whenTrue(_ closure: () throws -> Void) rethrows -> Self {
    switch self {
    case true:
      try closure()
    case false:
      break
    }
    return self
  }
  
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
  @discardableResult func whenSome(_ closure: (Wrapped) throws -> Void) rethrows -> Self {
    switch self {
    case let .some(wrapped):
      try closure(wrapped)
    case .none:
      break
    }
    return self
  }
  
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
  @discardableResult func whenSuccess(_ closure: (Success) throws -> Void) rethrows -> Self {
    switch self {
    case let .success(success):
      try closure(success)
    case .failure:
      break
    }
    return self
  }
  
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
