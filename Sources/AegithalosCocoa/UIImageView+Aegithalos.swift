#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UIImageView {
  
  @inlinable func image(_ image: UIImage?) -> Setup {
    composed { (subject: Subject) in subject.image = image }
  }
  
  @inlinable func image(
    named imageName: String,
    from bundle: Bundle? = nil,
    compatibleWith traitCollection: UITraitCollection? = nil
  ) -> Setup {
    composed { (subject: Subject) in
      subject.image = UIImage(named: imageName, in: bundle, compatibleWith: traitCollection)
    }
  }
  
  @available(iOS 13.0, *)
  @inlinable func image(
    symbol symbolName: String,
    compatibleWith traitCollection: UITraitCollection? = nil
  ) -> Setup {
    composed { (subject: Subject) in
      subject.image = UIImage(systemName: symbolName, compatibleWith: traitCollection)
    }
  }
}

// MARK: - Mutation

public extension Mutation where Subject: UIImageView {
  
  @inlinable static func image(
    named imageName: String,
    from bundle: Bundle? = nil,
    compatibleWith traitCollection: UITraitCollection? = nil
  ) -> Self {
    .custom { (subject: Subject) in
      subject.image = UIImage(
        named: imageName,
        in: bundle,
        compatibleWith: traitCollection
      )
    }
  }
  
  @available(iOS 13.0, *)
  @inlinable static func image(
    symbol symbolName: String,
    compatibleWith traitCollection: UITraitCollection? = nil
  ) -> Self {
    .custom { (subject: Subject) in
      subject.image = UIImage(
        systemName: symbolName,
        compatibleWith: traitCollection
      )
    }
  }
}

#endif
