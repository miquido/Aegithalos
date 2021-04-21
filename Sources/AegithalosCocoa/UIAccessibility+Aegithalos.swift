#if canImport(UIKit)
import UIKit
import Aegithalos

// MARK: - Mutations

public extension Mutation where Subject: UIAccessibilityIdentification {
  
  @inlinable static func accessibilityIdentifier(_ identifier: String?) -> Self {
    Self { (subject: Subject) in
      subject.accessibilityIdentifier = identifier
    }
  }
}

public extension Mutation where Subject: UIAccessibilityContentSizeCategoryImageAdjusting {
  
  @inlinable static func adjustsImageSizeForAccessibilityContentSizeCategory(_ value: Bool) -> Self {
    .custom  { (subject: Subject) in
      subject.adjustsImageSizeForAccessibilityContentSizeCategory = value
    }
  }
}

public extension Mutation where Subject: NSObject & UIAccessibilityIdentification {
  
  @inlinable static func accessibilityElements(_ value: [Any]?) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityElements = value
    }
  }
  
  @inlinable static func accessibilityContainerType(_ value: UIAccessibilityContainerType) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityContainerType = value
    }
  }
  
  @inlinable static func isAccessibilityElement(_ value: Bool) -> Self {
    .custom  { (subject: Subject) in
      subject.isAccessibilityElement = value
    }
  }
  
  @inlinable static func accessibilityLabel(_ value: String?) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityLabel = value
    }
  }
  
  @inlinable static func accessibilityAttributedLabel(_ value: NSAttributedString?) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityAttributedLabel = value
    }
  }
  
  @inlinable static func accessibilityHint(_ value: String?) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityHint = value
    }
  }
  
  @inlinable static func accessibilityAttributedHint(_ value: NSAttributedString?) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityAttributedHint = value
    }
  }
  
  @inlinable static func accessibilityValue(_ value: String?) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityValue = value
    }
  }
  
  @inlinable static func accessibilityAttributedValue(_ value: NSAttributedString?) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityAttributedValue = value
    }
  }
  
  @inlinable static func accessibilityTraits(_ value: UIAccessibilityTraits) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityTraits = value
    }
  }
  
  @inlinable static func accessibilityFrame(_ value: CGRect) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityFrame = value
    }
  }
  
  @inlinable static func accessibilityPath(_ value: UIBezierPath?) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityPath = value
    }
  }
  
  @inlinable static func accessibilityActivationPoint(_ value: CGPoint) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityActivationPoint = value
    }
  }
  
  @inlinable static func accessibilityLanguage(_ value: String?) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityLanguage = value
    }
  }
  
  @inlinable static func accessibilityElementsHidden(_ value: Bool) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityElementsHidden = value
    }
  }
  
  @inlinable static func accessibilityViewIsModal(_ value: Bool) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityViewIsModal = value
    }
  }
  
  @inlinable static func shouldGroupAccessibilityChildren(_ value: Bool) -> Self {
    .custom  { (subject: Subject) in
      subject.shouldGroupAccessibilityChildren = value
    }
  }
  
  @inlinable static func accessibilityNavigationStyle(_ value: UIAccessibilityNavigationStyle) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityNavigationStyle = value
    }
  }
  
  @available(iOS 13.0, *)
  @inlinable static func accessibilityRespondsToUserInteraction(_ value: Bool) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityRespondsToUserInteraction = value
    }
  }
  
  @available(iOS 13.0, *)
  @inlinable static func accessibilityUserInputLabels(_ value: [String]) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityUserInputLabels = value
    }
  }
  
  @available(iOS 13.0, *)
  @inlinable static func accessibilityAttributedUserInputLabels(_ value: [NSAttributedString]) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityAttributedUserInputLabels = value
    }
  }
  
  @available(iOS 13.0, *)
  @inlinable static func accessibilityTextualContext(_ value: UIAccessibilityTextualContext?) -> Self {
    .custom  { (subject: Subject) in
      subject.accessibilityTextualContext = value
    }
  }
}
#endif
