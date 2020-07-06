#if canImport(UIKit)

import UIKit
import Aegithalos
  
public extension Setup where Subject: UITextField {
  
  @inlinable func text(_ string: String) -> Setup {
    composed { textField in textField.text = string }
  }
  
  @inlinable func text(localized key: String, localizationComment: String = "") -> Setup {
    composed { textField in textField.text = NSLocalizedString(key, comment: localizationComment) }
  }
  
  @inlinable func isSecureTextEntry(_ isSecure: Bool) -> Setup {
    composed { textField in textField.isSecureTextEntry = isSecure }
  }
  
  @inlinable func borderStyle(_ borderStyle: UITextField.BorderStyle) -> Setup {
    composed { textField in textField.borderStyle = borderStyle }
  }
  
  @inlinable func font(_ font: UIFont) -> Setup {
    composed { textField in textField.font = font }
  }
  
  @inlinable func textColor(_ color: UIColor) -> Setup {
    composed { textField in textField.textColor = color }
  }
  
  @inlinable func attributedPlaceholder(_ attributedString: NSAttributedString) -> Setup {
    composed { textField in textField.attributedPlaceholder = attributedString }
  }
  
  @inlinable func textAlignment(_ alignment: NSTextAlignment) -> Setup {
    composed { textField in textField.textAlignment = alignment }
  }
  
  @inlinable func tintColor(_ color: UIColor) -> Setup {
    composed { textField in textField.tintColor = color }
  }
  
  @inlinable func autocapitalizationType(_ autocapitalizationType: UITextAutocapitalizationType) -> Setup {
    composed { textView in textView.autocapitalizationType = autocapitalizationType }
  }
}

#endif
