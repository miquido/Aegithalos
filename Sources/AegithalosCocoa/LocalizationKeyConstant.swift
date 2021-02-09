public struct LocalizationKeyConstant {
  
  public var rawValue: String
}

extension LocalizationKeyConstant: ExpressibleByStringLiteral {
  
  public init(stringLiteral value: StaticString) {
    self.rawValue = "\(value)"
  }
}
