#if canImport(UIKit)
import UIKit
import Aegithalos

public extension Setup where Subject: UIAccessibilityIdentification {

  @inlinable func accessibilityIdentifier(_ identifier: String?) -> Setup {
    composed { (subject: Subject) in subject.accessibilityIdentifier = identifier }
  }
}

public extension Setup where Subject: UIAccessibilityContentSizeCategoryImageAdjusting {

  @inlinable func adjustsImageSizeForAccessibilityContentSizeCategory(_ adjust: Bool) -> Setup {
    composed { (subject: Subject) in subject.adjustsImageSizeForAccessibilityContentSizeCategory = adjust }
  }
}

public extension Setup where Subject: NSObject & UIAccessibilityIdentification {

  @inlinable func accessibilityElements(_ accessibilityElements: [Any]?) -> Setup {
    composed { (subject: Subject) in subject.accessibilityElements = accessibilityElements }
  }

  @inlinable func accessibilityContainerType(_ accessibilityContainerType: UIAccessibilityContainerType) -> Setup {
    composed { (subject: Subject) in subject.accessibilityContainerType = accessibilityContainerType }
  }

  @inlinable func isAccessibilityElement(_ isAccessibilityElement: Bool) -> Setup {
    composed { (subject: Subject) in subject.isAccessibilityElement = isAccessibilityElement }
  }

  @inlinable func accessibilityLabel(_ accessibilityLabel: String?) -> Setup {
    composed { (subject: Subject) in subject.accessibilityLabel = accessibilityLabel }
  }

  @inlinable func accessibilityAttributedLabel(_ accessibilityAttributedLabel: NSAttributedString?) -> Setup {
    composed { (subject: Subject) in subject.accessibilityAttributedLabel = accessibilityAttributedLabel }
  }

  @inlinable func accessibilityHint(_ accessibilityHint: String?) -> Setup {
    composed { (subject: Subject) in subject.accessibilityHint = accessibilityHint }
  }

  @inlinable func accessibilityAttributedHint(_ accessibilityAttributedHint: NSAttributedString?) -> Setup {
    composed { (subject: Subject) in subject.accessibilityAttributedHint = accessibilityAttributedHint }
  }

  @inlinable func accessibilityValue(_ accessibilityValue: String?) -> Setup {
    composed { (subject: Subject) in subject.accessibilityValue = accessibilityValue }
  }

  @inlinable func accessibilityAttributedValue(_ accessibilityAttributedValue: NSAttributedString?) -> Setup {
    composed { (subject: Subject) in subject.accessibilityAttributedValue = accessibilityAttributedValue }
  }

  @inlinable func accessibilityTraits(_ accessibilityTraits: UIAccessibilityTraits) -> Setup {
    composed { (subject: Subject) in subject.accessibilityTraits = accessibilityTraits }
  }

  @inlinable func accessibilityFrame(_ accessibilityFrame: CGRect) -> Setup {
    composed { (subject: Subject) in subject.accessibilityFrame = accessibilityFrame }
  }

  @inlinable func accessibilityPath(_ accessibilityPath: UIBezierPath?) -> Setup {
    composed { (subject: Subject) in subject.accessibilityPath = accessibilityPath }
  }

  @inlinable func accessibilityActivationPoint(_ accessibilityActivationPoint: CGPoint) -> Setup {
    composed { (subject: Subject) in subject.accessibilityActivationPoint = accessibilityActivationPoint }
  }

  @inlinable func accessibilityLanguage(_ accessibilityLanguage: String?) -> Setup {
    composed { (subject: Subject) in subject.accessibilityLanguage = accessibilityLanguage }
  }

  @inlinable func accessibilityElementsHidden(_ accessibilityElementsHidden: Bool) -> Setup {
    composed { (subject: Subject) in subject.accessibilityElementsHidden = accessibilityElementsHidden }
  }

  @inlinable func accessibilityViewIsModal(_ accessibilityViewIsModal: Bool) -> Setup {
    composed { (subject: Subject) in subject.accessibilityViewIsModal = accessibilityViewIsModal }
  }

  @inlinable func shouldGroupAccessibilityChildren(_ shouldGroupAccessibilityChildren: Bool) -> Setup {
    composed { (subject: Subject) in subject.shouldGroupAccessibilityChildren = shouldGroupAccessibilityChildren }
  }

  @inlinable func accessibilityNavigationStyle(_ accessibilityNavigationStyle: UIAccessibilityNavigationStyle) -> Setup {
    composed { (subject: Subject) in subject.accessibilityNavigationStyle = accessibilityNavigationStyle }
  }

  @available(iOS 13.0, *)
  @inlinable func accessibilityRespondsToUserInteraction(_ accessibilityRespondsToUserInteraction: Bool) -> Setup {
    composed { (subject: Subject) in subject.accessibilityRespondsToUserInteraction = accessibilityRespondsToUserInteraction }
  }

  @available(iOS 13.0, *)
  @inlinable func accessibilityUserInputLabels(_ accessibilityUserInputLabels: [String]) -> Setup {
    composed { (subject: Subject) in subject.accessibilityUserInputLabels = accessibilityUserInputLabels }
  }

  @available(iOS 13.0, *)
  @inlinable func accessibilityAttributedUserInputLabels(_ accessibilityAttributedUserInputLabels: [NSAttributedString]) -> Setup {
    composed { (subject: Subject) in subject.accessibilityAttributedUserInputLabels = accessibilityAttributedUserInputLabels }
  }

  @available(iOS 13.0, *)
  @inlinable func accessibilityTextualContext(_ accessibilityTextualContext: UIAccessibilityTextualContext?) -> Setup {
    composed { (subject: Subject) in subject.accessibilityTextualContext = accessibilityTextualContext }
  }
}

// MARK: - Mutation

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
