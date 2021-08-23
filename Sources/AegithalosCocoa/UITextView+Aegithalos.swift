#if canImport(UIKit)
  import UIKit
  import Aegithalos

  // MARK: - Mutations

  extension Mutation where Subject: UITextView {

    @inlinable public static func text(_ value: String) -> Self {
      Self { (subject: Subject) in
        subject.text = value
      }
    }

    @inlinable public static func text(
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
          subject.text = localized
        } else {
          subject.text = String(
            format: localized,
            arguments: arguments
          )
        }
      }
    }

    @inlinable public static func font(_ value: UIFont) -> Self {
      Self { (subject: Subject) in
        subject.font = value
      }
    }

    @inlinable public static func textContainerInset(_ value: UIEdgeInsets) -> Self {
      Self { (subject: Subject) in
        subject.textContainerInset = value
      }
    }

    @inlinable public static func returnKeyType(_ value: UIReturnKeyType) -> Self {
      Self { (subject: Subject) in
        subject.returnKeyType = value
      }
    }

    @inlinable public static func lineBreakMode(_ value: NSLineBreakMode) -> Self {
      Self { (subject: Subject) in
        subject.textContainer.lineBreakMode = value
      }
    }

    @inlinable public static func lineFragmentPadding(_ value: CGFloat) -> Self {
      Self { (subject: Subject) in
        subject.textContainer.lineFragmentPadding = value
      }
    }

    @inlinable public static func usesFontLeading(_ value: Bool) -> Self {
      Self { (subject: Subject) in
        subject.layoutManager.usesFontLeading = value
      }
    }

    @inlinable public static func scrollEnabled(_ value: Bool) -> Self {
      Self { (subject: Subject) in
        subject.isScrollEnabled = value
      }
    }

    @inlinable public static func editable(_ value: Bool) -> Self {
      Self { (subject: Subject) in
        subject.isEditable = value
      }
    }

    @inlinable public static func selectable(_ value: Bool) -> Self {
      Self { (subject: Subject) in
        subject.isSelectable = value
      }
    }

    @inlinable public static func tintColor(_ value: UIColor) -> Self {
      Self { (subject: Subject) in
        subject.tintColor = value
      }
    }

    @inlinable public static func textColor(_ value: UIColor) -> Self {
      Self { (subject: Subject) in
        subject.textColor = value
      }
    }

    @inlinable public static func textAlignment(_ value: NSTextAlignment) -> Self {
      Self { (subject: Subject) in
        subject.textAlignment = value
      }
    }

    @inlinable public static func delegate(_ value: UITextViewDelegate) -> Self {
      .custom { [unowned value] (subject: Subject) in
        subject.delegate = value
      }
    }
  }
#endif
