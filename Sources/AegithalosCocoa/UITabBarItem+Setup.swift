#if canImport(UIKit)

import UIKit
import Aegithalos

public extension Setup where Subject: UITabBarItem {
  
  @inlinable func badgeValue(_ text: String) -> Setup {
    composed { (subject: Subject) in subject.badgeValue = text }
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

#endif
