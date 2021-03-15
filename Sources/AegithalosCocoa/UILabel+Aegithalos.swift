#if canImport(UIKit)

import UIKit
import Aegithalos
  
public extension Setup where Subject: UILabel {
  
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
  
  @inlinable func attributedText(_ attributedString: NSAttributedString) -> Setup {
    composed { (subject: Subject) in subject.attributedText = attributedString }
  }
  
  @inlinable func font(_ font: UIFont) -> Setup {
    composed { (subject: Subject) in subject.font = font }
  }
  
  @inlinable func textColor(_ color: UIColor) -> Setup {
    composed { (subject: Subject) in subject.textColor = color }
  }
  
  @inlinable func textAlignment(_ alignment: NSTextAlignment) -> Setup {
    composed { (subject: Subject) in subject.textAlignment = alignment }
  }
  
  @inlinable func numberOfLines(_ numberOfLines: Int) -> Setup {
    composed { (subject: Subject) in subject.numberOfLines = numberOfLines }
  }
  
  @inlinable func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Setup {
    composed { (subject: Subject) in subject.lineBreakMode = lineBreakMode }
  }
}

// MARK: - Mutation

public extension Mutation where Subject: UILabel {
  
  @inlinable static func attributedText(_ value: NSAttributedString) -> Self {
    Self { (subject: Subject) in
      subject.attributedText = value
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
  
  @inlinable static func textAlignment(_ value: NSTextAlignment) -> Self {
    Self { (subject: Subject) in
      subject.textAlignment = value
    }
  }
  
  @inlinable static func numberOfLines(_ value: Int) -> Self {
    Self { (subject: Subject) in
      subject.numberOfLines = value
    }
  }
  
  @inlinable static func lineBreakMode(_ value: NSLineBreakMode) -> Self {
    Self { (subject: Subject) in
      subject.lineBreakMode = value
    }
  }
  
  @inlinable static func text(
    _ value: String
  ) -> Self {
    Self { (subject: Subject) in
      subject.text = value
    }
  }
  
  @inlinable static func text(
    localized key: LocalizationKeyConstant,
    fromTable tableName: String? = nil,
    inBundle bundle: Bundle = Bundle.main,
    arguments: CVarArg...
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
}
#endif
