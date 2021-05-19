import Foundation

public struct SymbolNameConstant {
  
  public var rawValue: String
}

extension SymbolNameConstant: ExpressibleByStringLiteral {
  
  public init(stringLiteral value: StringLiteralType) {
    self.rawValue = String(value)
  }
}
