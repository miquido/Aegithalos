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

#endif
