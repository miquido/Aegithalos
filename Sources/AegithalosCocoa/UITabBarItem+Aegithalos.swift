#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UITabBarItem {
  
  @inlinable func badgeValue(_ string: String) -> Setup {
    composed { (subject: Subject) in subject.badgeValue = string }
  }
  
  @inlinable func badgeValue(
    localized key: String,
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    value: String = "",
    localizationComment comment: String = ""
  ) -> Setup {
    composed { (subject: Subject) in
      subject.badgeValue = NSLocalizedString(
        key,
        tableName: tableName,
        bundle: bundle,
        value: value,
        comment: comment
      )
    }
  }
  
  @inlinable func badgeColor(_ color: UIColor) -> Setup {
    composed { (subject: Subject) in subject.badgeColor = color }
  }
  
  @inlinable func badgeTextAttributes(
    _ attributes: Dictionary<NSAttributedString.Key, Any>,
    forState state: UIControl.State = .normal
  ) -> Setup {
    composed { (subject: Subject) in subject.setBadgeTextAttributes(attributes, for: state) }
  }
  
  @inlinable func titlePositionAdjustment(_ adjustment: UIOffset) -> Setup {
    composed { (subject: Subject) in subject.titlePositionAdjustment = adjustment }
  }
  
  @inlinable func selectedImage(_ image: UIImage?) -> Setup {
    composed { (subject: Subject) in subject.selectedImage = image }
  }
  
  @inlinable func selectedImage(
    named imageName: String,
    from bundle: Bundle? = nil,
    compatibleWith traitCollection: UITraitCollection? = nil
  ) -> Setup {
    composed { (subject: Subject) in
      subject.selectedImage = UIImage(named: imageName, in: bundle, compatibleWith: traitCollection)
    }
  }
  
  @available(iOS 13.0, *)
  @inlinable func selectedImage(
    symbol symbolName: String,
    compatibleWith traitCollection: UITraitCollection? = nil
  ) -> Setup {
    composed { (subject: Subject) in
      subject.selectedImage = UIImage(systemName: symbolName, compatibleWith: traitCollection)
    }
  }
}

// MARK: - Mutation

public extension Mutation where Subject: UITabBarItem {
  
  @inlinable static func badgeValue(
    localized key: String,
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    arguments: CVarArg...,
    forState state: UIControl.State = .normal
  ) -> Self {
    .custom { (subject: Subject) in
      let localized = NSLocalizedString(
        key,
        tableName: tableName,
        bundle: bundle,
        comment: ""
      )
      if arguments.isEmpty {
        subject.badgeValue = localized
      } else {
        subject.badgeValue = String(
          format: localized,
          arguments: arguments
        )
      }
    }
  }
  
  @inlinable static func badgeTextAttributes(
    _ attributes: Dictionary<NSAttributedString.Key, Any>,
    forState state: UIControl.State = .normal
  ) -> Self {
    .custom { (subject: Subject) in
      subject.setBadgeTextAttributes(attributes, for: state)
    }
  }
  
  @inlinable static func selectedImage(
    named imageName: String,
    from bundle: Bundle? = nil,
    compatibleWith traitCollection: UITraitCollection? = nil
  ) -> Self {
    .custom { (subject: Subject) in
      subject.selectedImage = UIImage(
        named: imageName,
        in: bundle,
        compatibleWith: traitCollection
      )
    }
  }
  
  @available(iOS 13.0, *)
  @inlinable static func selectedImage(
    symbol symbolName: String,
    compatibleWith traitCollection: UITraitCollection? = nil
  ) -> Self {
    .custom { (subject: Subject) in
      subject.selectedImage = UIImage(
        systemName: symbolName,
        compatibleWith: traitCollection
      )
    }
  }
}
#endif
