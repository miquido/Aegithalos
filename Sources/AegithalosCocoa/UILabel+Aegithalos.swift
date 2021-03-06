#if canImport(UIKit)
import UIKit
import Aegithalos
  
// MARK: - Mutations

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
