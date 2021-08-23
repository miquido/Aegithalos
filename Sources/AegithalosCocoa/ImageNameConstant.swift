public struct ImageNameConstant {

  public var rawValue: String
}

extension ImageNameConstant: ExpressibleByStringLiteral {

  public init(stringLiteral value: StaticString) {
    self.rawValue = "\(value)"
  }
}
