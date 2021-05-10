#if canImport(UIKit)
import UIKit
import Aegithalos
  
// MARK: - Mutations

public extension Mutation where Subject: UITextField {
  
  @inlinable static func text(_ value: String) -> Self {
    Self { (subject: Subject) in
      subject.text = value
    }
  }
  
  @inlinable static func secureTextEntry(_ value: Bool) -> Self {
    Self { (subject: Subject) in
      subject.isSecureTextEntry = value
    }
  }
  
  @inlinable static func borderStyle(_ value: UITextField.BorderStyle) -> Self {
    Self { (subject: Subject) in
      subject.borderStyle = value
    }
  }
  
  @inlinable static func font(_ value: UIFont) -> Self {
    Self { (subject: Subject) in
      subject.font = value
    }
  }
  
  @inlinable static func textColor(_ value: UIColor) -> Self {
    Self { (subject: Subject) in
      subject.textColor = value
    }
  }
  
  @inlinable static func attributedPlaceholder(_ value: NSAttributedString) -> Self {
    Self { (subject: Subject) in
      subject.attributedPlaceholder = value
    }
  }
  
  @inlinable static func textAlignment(_ value: NSTextAlignment) -> Self {
    Self { (subject: Subject) in
      subject.textAlignment = value
    }
  }
  
  @inlinable static func tintColor(_ value: UIColor) -> Self {
    Self { (subject: Subject) in
      subject.tintColor = value
    }
  }
  
  @inlinable static func autocapitalizationType(_ value: UITextAutocapitalizationType) -> Self {
    Self { (subject: Subject) in
      subject.autocapitalizationType = value
    }
  }
  
  @inlinable static func delegate(_ value: UITextFieldDelegate) -> Self {
    .custom { [unowned value] (subject: Subject) in
      subject.delegate = value
    }
  }
  
  @inlinable static func placeholder(
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
        subject.placeholder = localized
      } else {
        subject.placeholder = String(
          format: localized,
          arguments: arguments
        )
      }
    }
  }
}
#endif
