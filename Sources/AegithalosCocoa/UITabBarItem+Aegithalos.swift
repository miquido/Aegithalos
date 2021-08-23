#if canImport(UIKit)
  import UIKit
  import Aegithalos

  // MARK: - Mutations

  extension Mutation where Subject: UITabBarItem {

    @inlinable public static func badgeValue(
      localized key: LocalizationKeyConstant,
      fromTable tableName: String? = nil,
      inBundle bundle: Bundle = Bundle.main,
      arguments: CVarArg...,
      forState state: UIControl.State = .normal
    ) -> Self {
      Self { (subject: Subject) in
        let localized = NSLocalizedString(
          key.rawValue,
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

    @inlinable public static func badgeTextAttributes(
      _ attributes: [NSAttributedString.Key: Any],
      forState state: UIControl.State = .normal
    ) -> Self {
      Self { (subject: Subject) in
        subject.setBadgeTextAttributes(attributes, for: state)
      }
    }

    @inlinable public static func selectedImage(
      named imageName: ImageNameConstant,
      from bundle: Bundle? = nil,
      compatibleWith traitCollection: UITraitCollection? = nil
    ) -> Self {
      Self { (subject: Subject) in
        subject.selectedImage = UIImage(
          named: imageName.rawValue,
          in: bundle,
          compatibleWith: traitCollection
        )
      }
    }

    @available(iOS 13.0, *)
    @inlinable public static func selectedImage(
      symbol symbolName: String,
      compatibleWith traitCollection: UITraitCollection? = nil
    ) -> Self {
      Self { (subject: Subject) in
        subject.selectedImage = UIImage(
          systemName: symbolName,
          compatibleWith: traitCollection
        )
      }
    }
  }
#endif
