#if canImport(UIKit)
import UIKit
import Aegithalos

// MARK: - Mutations

public extension Mutation where Subject: UIBarItem {
  
  @inlinable static func enabled(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.isEnabled = value
    }
  }
  
  @inlinable static func imageInsets(_ value: UIEdgeInsets) -> Self {
    Self { (subject: Subject) in
      subject.imageInsets = value
    }
  }
  
  @inlinable static func title(
    _ value: String
  ) -> Self {
    Self { (subject: Subject) in
      subject.title = value
    }
  }
  
  @inlinable static func title(
    localized key: LocalizationKeyConstant,
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    arguments: CVarArg...
  ) -> Self {
    Self { (subject: Subject) in
      let localized = NSLocalizedString(
        key.rawValue,
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
    symbol symbolName: String,
    compatibleWith traitCollection: UITraitCollection? = nil
  ) -> Self {
    Self { (subject: Subject) in
      subject.image = UIImage(
        systemName: symbolName,
        compatibleWith: traitCollection
      )
    }
  }
}

#endif
