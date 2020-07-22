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

#endif
