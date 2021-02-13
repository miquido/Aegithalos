#if canImport(Combine)
import Combine

@available(OSX 10.15, iOS 13.0, *)
public final class State<Value> {
  
  public var value: Value {
    get { valueGetter() }
    set { valueSetter(newValue) }
  }
  private let valueGetter: () -> Value
  private let valueSetter: (Value) -> Void
  private let valuePublisher: AnyPublisher<Value, Never>
  
  public init(initial: Value) {
    precondition(!(Value.self is AnyObject.Type), "Reference types are not supported in State")
    let valueSubject = CurrentValueSubject<Value, Never>(initial)
    self.valueGetter = { valueSubject.value }
    self.valueSetter = { valueSubject.value = $0 }
    self.valuePublisher = valueSubject.eraseToAnyPublisher()
  }
  
  fileprivate init(
    valueGetter: @escaping () -> Value,
    valueSetter: @escaping (Value) -> Void,
    valuePublisher: AnyPublisher<Value, Never>
  ) {
    self.valueGetter = valueGetter
    self.valueSetter = valueSetter
    self.valuePublisher = valuePublisher
  }
  
  public func view<ViewValue>(
    _ keyPath: KeyPath<Value, ViewValue>
  ) -> StateView<ViewValue> {
    precondition(!(ViewValue.self is AnyObject.Type), "Reference types are not supported in State")
    return StateView<ViewValue>(
      valueGetter: { self.value[keyPath: keyPath] },
      valuePublisher: valuePublisher
        .map(keyPath)
        .eraseToAnyPublisher()
    )
  }
  
  public func scope<ScopeValue>(
    _ keyPath: WritableKeyPath<Value, ScopeValue>
  ) -> State<ScopeValue> {
    precondition(!(ScopeValue.self is AnyObject.Type), "Reference types are not supported in State")
    return State<ScopeValue>(
      valueGetter: { self.value[keyPath: keyPath] },
      valueSetter: { self.value[keyPath: keyPath] = $0 },
      valuePublisher: valuePublisher
        .map(keyPath)
        .eraseToAnyPublisher()
    )
  }
  
  func combined<ScopedValue, OtherValue>(
    scope keyPath: WritableKeyPath<Value, ScopedValue>,
    withInitial otherValue: OtherValue
  ) -> State<(ScopedValue, OtherValue)> {
    let otherValueSubject = CurrentValueSubject<OtherValue, Never>(otherValue)
    return State<(ScopedValue, OtherValue)>(
      valueGetter: {
        (
          self.value[keyPath: keyPath],
          otherValueSubject.value
        )
      },
      valueSetter: {
        self.value[keyPath: keyPath] = $0.0
        otherValueSubject.value = $0.1
      },
      valuePublisher: Publishers
        .CombineLatest(self.publisher.map(keyPath), otherValueSubject)
        .eraseToAnyPublisher()
    )
  }
  
  func combined<ScopedValue, OtherValue>(
    scope keyPath: WritableKeyPath<Value, ScopedValue>,
    with other: State<OtherValue>
  ) -> State<(ScopedValue, OtherValue)> {
    return State<(ScopedValue, OtherValue)>(
      valueGetter: {
        (
          self.value[keyPath: keyPath],
          other.value
        )
      },
      valueSetter: {
        self.value[keyPath: keyPath] = $0.0
        other.value = $0.1
      },
      valuePublisher: Publishers
        .CombineLatest(self.publisher.map(keyPath), other.publisher)
        .eraseToAnyPublisher()
    )
  }
  
  func apply(_ mutation: Mutation<Value>) {
    mutation.apply(self)
  }
}

@available(OSX 10.15, iOS 13.0, *)
public extension State {
  
  var publisher: AnyPublisher<Value, Never> { valuePublisher }
}

@available(OSX 10.15, iOS 13.0, *)
public final class StateView<Value> {
  
  public var value: Value {
    get { valueGetter() }
  }
  private let valueGetter: () -> Value
  private let valuePublisher: AnyPublisher<Value, Never>
  
  fileprivate init(
    valueGetter: @escaping () -> Value,
    valuePublisher: AnyPublisher<Value, Never>
  ) {
    self.valueGetter = valueGetter
    self.valuePublisher = valuePublisher
  }
  
  public func view<ViewValue>(
    _ keyPath: KeyPath<Value, ViewValue>
  ) -> StateView<ViewValue> {
    precondition(!(ViewValue.self is AnyObject.Type), "Reference types are not supported in State")
    return StateView<ViewValue>(
      valueGetter: { self.value[keyPath: keyPath] },
      valuePublisher: valuePublisher
        .map(keyPath)
        .eraseToAnyPublisher()
    )
  }
}

@available(OSX 10.15, iOS 13.0, *)
public extension StateView {
  
  var publisher: AnyPublisher<Value, Never> { valuePublisher }
}
#endif
