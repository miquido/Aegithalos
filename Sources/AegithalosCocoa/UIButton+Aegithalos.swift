#if canImport(UIKit)
  import UIKit
  import Aegithalos

  // MARK: - Mutations

  extension Mutation where Subject: UIButton {

    @inlinable public static func titleFont(_ value: UIFont) -> Self {
      Self { (subject: Subject) in
        subject.titleLabel?.font = value
      }
    }

    @inlinable public static func attributedTitle(
      _ value: NSAttributedString?,
      forState state: UIControl.State = .normal
    ) -> Self {
      Self { (subject: Subject) in
        subject.setAttributedTitle(value, for: state)
      }
    }

    @inlinable public static func titleInsets(_ value: UIEdgeInsets) -> Self {
      Self { (subject: Subject) in
        subject.titleEdgeInsets = value
      }
    }

    @inlinable public static func titleColor(
      _ value: UIColor,
      forState state: UIControl.State = .normal
    ) -> Self {
      Self { (subject: Subject) in
        subject.setTitleColor(value, for: state)
      }
    }

    @inlinable public static func titleAlignment(_ value: NSTextAlignment) -> Self {
      Self { (subject: Subject) in
        subject.titleLabel?.textAlignment = value
      }
    }

    @inlinable public static func titleLineBreakMode(_ value: NSLineBreakMode) -> Self {
      Self { (subject: Subject) in
        subject.titleLabel?.lineBreakMode = value
      }
    }

    @inlinable public static func title(
      _ value: String?,
      forState state: UIControl.State = .normal
    ) -> Self {
      Self { (subject: Subject) in
        subject.setTitle(value, for: state)
      }
    }

    @inlinable public static func title(
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
          subject.setTitle(localized, for: state)
        } else {
          subject.setTitle(
            String(
              format: localized,
              arguments: arguments
            ),
            for: state
          )
        }
      }
    }

    @inlinable public static func backgroundImage(
      named imageName: ImageNameConstant,
      from bundle: Bundle? = nil,
      compatibleWith traitCollection: UITraitCollection? = nil,
      forState state: UIControl.State = .normal
    ) -> Self {
      Self { (subject: Subject) in
        subject.setBackgroundImage(
          UIImage(
            named: imageName.rawValue,
            in: bundle,
            compatibleWith: traitCollection
          ),
          for: state
        )
      }
    }

    @inlinable public static func image(
      named imageName: ImageNameConstant,
      from bundle: Bundle? = nil,
      withInsets insets: UIEdgeInsets = .zero,
      compatibleWith traitCollection: UITraitCollection? = nil,
      forState state: UIControl.State = .normal
    ) -> Self {
      Self { (subject: Subject) in
        subject.setImage(
          UIImage(
            named: imageName.rawValue,
            in: bundle,
            compatibleWith: traitCollection
          ),
          for: state
        )
        subject.imageEdgeInsets = insets
      }
    }

    @available(iOS 13.0, *)
    @inlinable public static func image(
      symbol symbolName: String,
      withInsets insets: UIEdgeInsets = .zero,
      compatibleWith traitCollection: UITraitCollection? = nil,
      forState state: UIControl.State = .normal
    ) -> Self {
      Self { (subject: Subject) in
        subject.setImage(
          UIImage(
            systemName: symbolName,
            compatibleWith: traitCollection
          ),
          for: state
        )
        subject.imageEdgeInsets = insets
      }
    }
  }

#endif
