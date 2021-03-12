#if canImport(UIKit)

import UIKit
import Aegithalos
  
public extension Setup where Subject: UITextField {
  
  @inlinable func text(_ string: String) -> Setup {
    composed { (subject: Subject) in subject.text = string }
  }
  
  @inlinable func text(
    localized key: String,
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    value: String = "",
    localizationComment comment: String = ""
  ) -> Setup {
    composed { (subject: Subject) in
      subject.text = NSLocalizedString(
        key,
        tableName: tableName,
        bundle: bundle,
        value: value,
        comment: comment
      )
    }
  }
  
  @inlinable func isSecureTextEntry(_ isSecure: Bool) -> Setup {
    composed { (subject: Subject) in subject.isSecureTextEntry = isSecure }
  }
  
  @inlinable func borderStyle(_ borderStyle: UITextField.BorderStyle) -> Setup {
    composed { (subject: Subject) in subject.borderStyle = borderStyle }
  }
  
  @inlinable func font(_ font: UIFont) -> Setup {
    composed { (subject: Subject) in subject.font = font }
  }
  
  @inlinable func textColor(_ color: UIColor) -> Setup {
    composed { (subject: Subject) in subject.textColor = color }
  }
  
  @inlinable func attributedPlaceholder(_ attributedString: NSAttributedString) -> Setup {
    composed { (subject: Subject) in subject.attributedPlaceholder = attributedString }
  }
  
  @inlinable func textAlignment(_ alignment: NSTextAlignment) -> Setup {
    composed { (subject: Subject) in subject.textAlignment = alignment }
  }
  
  @inlinable func tintColor(_ color: UIColor) -> Setup {
    composed { (subject: Subject) in subject.tintColor = color }
  }
  
  @inlinable func autocapitalizationType(_ autocapitalizationType: UITextAutocapitalizationType) -> Setup {
    composed { (subject: Subject) in subject.autocapitalizationType = autocapitalizationType }
  }
  
  @inlinable func delegate(_ delegate: UITextFieldDelegate) -> Setup {
    composed { [unowned delegate] (subject: Subject) in subject.delegate = delegate }
  }
}

// MARK: - Mutation

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
  
  @inlinable func borderStyle(_ value: UITextField.BorderStyle) -> Self {
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
