#if canImport(UIKit)
import UIKit
import Aegithalos
  
// MARK: - Mutations

public extension Mutation where Subject: UITextView {
  
  @inlinable static func text(_ value: String) -> Self {
    Self { (subject: Subject) in
      subject.text = value
    }
  }
  
  @inlinable static func text(
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
  
  @inlinable static func font(_ value: UIFont) -> Self {
    Self { (subject: Subject) in
      subject.font = value
    }
  }
  
  @inlinable static func textContainerInset(_ value: UIEdgeInsets) -> Self {
    Self { (subject: Subject) in
      subject.textContainerInset = value
    }
  }
  
  @inlinable static func returnKeyType(_ value: UIReturnKeyType) -> Self {
    Self { (subject: Subject) in
      subject.returnKeyType = value
    }
  }
  
  @inlinable static func lineBreakMode(_ value: NSLineBreakMode) -> Self {
    Self { (subject: Subject) in
      subject.textContainer.lineBreakMode = value
    }
  }
  
  @inlinable static func lineFragmentPadding(_ value: CGFloat) -> Self {
    Self { (subject: Subject) in
      subject.textContainer.lineFragmentPadding = value
    }
  }
  
  @inlinable static func usesFontLeading(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.layoutManager.usesFontLeading = value
    }
  }
  
  @inlinable static func scrollEnabled(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.isScrollEnabled = value
    }
  }
  
  @inlinable static func editable(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.isEditable = value
    }
  }
  
  @inlinable static func selectable(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.isSelectable = value
    }
  }
  
  @inlinable static func tintColor(_ value: UIColor) -> Self {
    Self { (subject: Subject) in
      subject.tintColor = value
    }
  }
  
  @inlinable static func textColor(_ value: UIColor) -> Self {
    Self { (subject: Subject) in
      subject.textColor = value
    }
  }
  
  @inlinable static func textAlignment(_ value: NSTextAlignment) -> Self {
    Self { (subject: Subject) in
      subject.textAlignment = value
    }
  }
  
  @inlinable static func delegate(_ value: UITextViewDelegate) -> Self {
    .custom { [unowned value] (subject: Subject) in
      subject.delegate = value
    }
  }
}
#endif
