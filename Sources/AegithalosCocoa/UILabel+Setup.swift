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

#endif
