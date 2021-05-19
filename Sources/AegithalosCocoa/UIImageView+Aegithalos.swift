#if canImport(UIKit)
import UIKit
import Aegithalos

// MARK: - Mutations

public extension Mutation where Subject: UIImageView {
  
  @inlinable static func image(
    _ value: UIImage
  ) -> Self {
    Self { (subject: Subject) in
      subject.image = value
    }
  }
  
  @inlinable static func image(
    named imageName: ImageNameConstant,
    from bundle: Bundle? = nil,
    compatibleWith traitCollection: UITraitCollection? = nil
  ) -> Self {
    Self { (subject: Subject) in
      subject.image = UIImage(
        named: imageName.rawValue,
        in: bundle,
        compatibleWith: traitCollection
      )
    }
  }
  
  @available(iOS 13.0, *)
  @inlinable static func image(
    symbol: SymbolNameConstant,
    compatibleWith traitCollection: UITraitCollection? = nil
  ) -> Self {
    Self { (subject: Subject) in
      subject.image = UIImage(
        systemName: symbol.rawValue,
        compatibleWith: traitCollection
      )
    }
  }
}

#endif
