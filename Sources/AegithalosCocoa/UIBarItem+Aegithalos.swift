#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UIBarItem {
  
  @inlinable func title(_ string: String?) -> Setup {
    composed { (subject: Subject) in subject.title = string }
  }
  
  @inlinable func title(
    localized key: String,
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    value: String = "",
    localizationComment comment: String = ""
  ) -> Setup {
    composed { (subject: Subject) in
      subject.title = NSLocalizedString(
        key,
        tableName: tableName,
        bundle: bundle,
        value: value,
        comment: comment
      )
    }
  }
  
  @inlinable func isEnabled(_ enabled: Bool) -> Setup {
    composed { (subject: Subject) in subject.isEnabled = enabled }
  }
  
  @inlinable func imageInsets(_ insets: UIEdgeInsets) -> Setup {
    composed { (subject: Subject) in subject.imageInsets = insets }
  }
  
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

public extension Mutation where Subject: UIBarItem {
  
  @inlinable static func title(
    localized key: String,
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    arguments: CVarArg...
  ) -> Self {
    .custom { (subject: Subject) in
      let localized = NSLocalizedString(
        key,
        tableName: tableName,
        bundle: bundle,
        comment: ""
      )
      if arguments.isEmpty {
        subject.title = localized
      } else {
        subject.title = String(
          format: localized,
          arguments: arguments
        )
      }
    }
  }
  
  @inlinable func image(
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
  @inlinable func image(
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
