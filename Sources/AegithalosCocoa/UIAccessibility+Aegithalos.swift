#if canImport(UIKit)
  import UIKit
  import Aegithalos

  // MARK: - Mutations

  extension Mutation where Subject: UIAccessibilityIdentification {

    @inlinable public static func accessibilityIdentifier(_ identifier: String?) -> Self {
      Self { (subject: Subject) in
        subject.accessibilityIdentifier = identifier
      }
    }
  }

  extension Mutation where Subject: UIAccessibilityContentSizeCategoryImageAdjusting {

    @inlinable public static func adjustsImageSizeForAccessibilityContentSizeCategory(_ value: Bool)
      -> Self
    {
      .custom { (subject: Subject) in
        subject.adjustsImageSizeForAccessibilityContentSizeCategory = value
      }
    }
  }

  extension Mutation where Subject: NSObject & UIAccessibilityIdentification {

    @inlinable public static func accessibilityElements(_ value: [Any]?) -> Self {
      .custom { (subject: Subject) in
        subject.accessibilityElements = value
      }
    }

    @inlinable public static func accessibilityContainerType(_ value: UIAccessibilityContainerType)
      -> Self
    {
      .custom { (subject: Subject) in
        subject.accessibilityContainerType = value
      }
    }

    @inlinable public static func isAccessibilityElement(_ value: Bool) -> Self {
      .custom { (subject: Subject) in
        subject.isAccessibilityElement = value
      }
    }

    @inlinable public static func accessibilityLabel(_ value: String?) -> Self {
      .custom { (subject: Subject) in
        subject.accessibilityLabel = value
      }
    }

    @inlinable public static func accessibilityAttributedLabel(_ value: NSAttributedString?) -> Self
    {
      .custom { (subject: Subject) in
        subject.accessibilityAttributedLabel = value
      }
    }

    @inlinable public static func accessibilityHint(_ value: String?) -> Self {
      .custom { (subject: Subject) in
        subject.accessibilityHint = value
      }
    }

    @inlinable public static func accessibilityAttributedHint(_ value: NSAttributedString?) -> Self
    {
      .custom { (subject: Subject) in
        subject.accessibilityAttributedHint = value
      }
    }

    @inlinable public static func accessibilityValue(_ value: String?) -> Self {
      .custom { (subject: Subject) in
        subject.accessibilityValue = value
      }
    }

    @inlinable public static func accessibilityAttributedValue(_ value: NSAttributedString?) -> Self
    {
      .custom { (subject: Subject) in
        subject.accessibilityAttributedValue = value
      }
    }

    @inlinable public static func accessibilityTraits(_ value: UIAccessibilityTraits) -> Self {
      .custom { (subject: Subject) in
        subject.accessibilityTraits = value
      }
    }

    @inlinable public static func accessibilityFrame(_ value: CGRect) -> Self {
      .custom { (subject: Subject) in
        subject.accessibilityFrame = value
      }
    }

    @inlinable public static func accessibilityPath(_ value: UIBezierPath?) -> Self {
      .custom { (subject: Subject) in
        subject.accessibilityPath = value
      }
    }

    @inlinable public static func accessibilityActivationPoint(_ value: CGPoint) -> Self {
      .custom { (subject: Subject) in
        subject.accessibilityActivationPoint = value
      }
    }

    @inlinable public static func accessibilityLanguage(_ value: String?) -> Self {
      .custom { (subject: Subject) in
        subject.accessibilityLanguage = value
      }
    }

    @inlinable public static func accessibilityElementsHidden(_ value: Bool) -> Self {
      .custom { (subject: Subject) in
        subject.accessibilityElementsHidden = value
      }
    }

    @inlinable public static func accessibilityViewIsModal(_ value: Bool) -> Self {
      .custom { (subject: Subject) in
        subject.accessibilityViewIsModal = value
      }
    }

    @inlinable public static func shouldGroupAccessibilityChildren(_ value: Bool) -> Self {
      .custom { (subject: Subject) in
        subject.shouldGroupAccessibilityChildren = value
      }
    }

    @inlinable public static func accessibilityNavigationStyle(
      _ value: UIAccessibilityNavigationStyle
    ) -> Self {
      .custom { (subject: Subject) in
        subject.accessibilityNavigationStyle = value
      }
    }

    @available(iOS 13.0, *)
    @inlinable public static func accessibilityRespondsToUserInteraction(_ value: Bool) -> Self {
      .custom { (subject: Subject) in
        subject.accessibilityRespondsToUserInteraction = value
      }
    }

    @available(iOS 13.0, *)
    @inlinable public static func accessibilityUserInputLabels(_ value: [String]) -> Self {
      .custom { (subject: Subject) in
        subject.accessibilityUserInputLabels = value
      }
    }

    @available(iOS 13.0, *)
    @inlinable public static func accessibilityAttributedUserInputLabels(
      _ value: [NSAttributedString]
    ) -> Self {
      .custom { (subject: Subject) in
        subject.accessibilityAttributedUserInputLabels = value
      }
    }

    @available(iOS 13.0, *)
    @inlinable public static func accessibilityTextualContext(
      _ value: UIAccessibilityTextualContext?
    ) -> Self {
      .custom { (subject: Subject) in
        subject.accessibilityTextualContext = value
      }
    }
  }
#endif
